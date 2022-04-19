Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5D4C43217
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 18:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i3m+jB1cMJOCgkHYOmpVEsmvyyOBA1ZnzlsndhtAfdw=; b=PtN1psNv2QHyAl
	9LY+0vx38219yiq48fpF03CLgDlqVOXSEaZDbgzprFNclB4BGCb1unJX10h4IeN3CSoA3ql2JySLD
	mry9HqGU/D26k2YqnxQgIu8HUqezs+Ld3ia/6m/mzB20Rs1knS86U1fSFYSTNIeSM0yIMf4yg4hJL
	+RF3o+F67vCHwU/6j8pQm8NgJQmbzgvSRwsxSaG4rj7aOV/cCslx3hsXdUZNu8HAoT7BlHXTsO0Ay
	GJJf5+csrTaI4ux3PXu4tHKm0BSSGJzCOJBsyw0T9F2A4Z8H+0WVqD8o5DVj9ITCnVlW01ioypjyD
	/Yqj0NYfFXjUpUJiqKSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngsa6-005fjC-Ti; Tue, 19 Apr 2022 18:28:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngsO6-005ZPy-C2; Tue, 19 Apr 2022 18:15:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id ABF856149D;
 Tue, 19 Apr 2022 18:15:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93B2BC385A7;
 Tue, 19 Apr 2022 18:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650392141;
 bh=IcmxqFD2X9nhz3AXQeNNFZ8G21v+9P1J/I/J4ImEWk8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oayH0Ua0wJgFN3FOUwQ+VYHKtsID0fDFlD07l6P8qr2tlGnVB9Qa9p/4DCYlh7Kn0
 M4pEg9bOIFAv7LQeCIEOt6xXpX9iV0zUpghOL8+ynQ4dSWXeAcFfwpqpRFgkOZo1z5
 hiqyZWw3Nf/vpeD8e+7KL/zXePM7osJ5YgiXOTAFJdWYW761/31GcnJYM0YS+R2eMz
 PAjBAj48JlNYTyO2UeNi7XqBJmFFLD1ZaGdXGy4WBXryJoMIX/wTIqO7FCpVgXHrb3
 +uk/XjQuTUUWddGQ++TuLi4dlA7nocvmBYNIgiW2rvNqDShbXgx6+PjI1WF4HvX+aY
 BAwFzwnWJMAdg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Borislav Petkov <bp@suse.de>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo.bianconi83@gmail.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Shayne Chen <shayne.chen@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 Sasha Levin <sashal@kernel.org>, lorenzo@kernel.org, pabeni@redhat.com,
 matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 4.19 07/12] mt76: Fix undefined behavior due to shift
 overflowing the constant
Date: Tue, 19 Apr 2022 14:15:20 -0400
Message-Id: <20220419181525.486166-7-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419181525.486166-1-sashal@kernel.org>
References: <20220419181525.486166-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_111542_550962_E90BD86E 
X-CRM114-Status: GOOD (  12.00  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RnJvbTogQm9yaXNsYXYgUGV0a292IDxicEBzdXNlLmRlPgoKWyBVcHN0cmVhbSBjb21taXQgZGJj
MmIxNzY0NzM0ODU3ZDY4NDI1NDY4ZmZhODQ4NmU5N2FiODlkZiBdCgpGaXg6CgogIGRyaXZlcnMv
bmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3NngyL3BjaS5jOiBJbiBmdW5jdGlvbiDigJht
dDc2eDJlX3Byb2Jl4oCZOgogIC4vLi9pbmNsdWRlL2xpbnV4L2NvbXBpbGVyX3R5cGVzLmg6MzUy
OjM4OiBlcnJvcjogY2FsbCB0byDigJhfX2NvbXBpbGV0aW1lX2Fzc2VydF85NDbigJkgXAoJZGVj
bGFyZWQgd2l0aCBhdHRyaWJ1dGUgZXJyb3I6IEZJRUxEX1BSRVA6IG1hc2sgaXMgbm90IGNvbnN0
YW50CiAgICBfY29tcGlsZXRpbWVfYXNzZXJ0KGNvbmRpdGlvbiwgbXNnLCBfX2NvbXBpbGV0aW1l
X2Fzc2VydF8sIF9fQ09VTlRFUl9fKQoKU2VlIGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvWWt3
UTYlMkJ0SUg4R1FwdWN0QHpuLnRuaWMgZm9yIHRoZSBnb3J5CmRldGFpbHMgYXMgdG8gd2h5IGl0
IHRyaWdnZXJzIHdpdGggb2xkZXIgZ2NjcyBvbmx5LgoKU2lnbmVkLW9mZi1ieTogQm9yaXNsYXYg
UGV0a292IDxicEBzdXNlLmRlPgpDYzogRmVsaXggRmlldGthdSA8bmJkQG5iZC5uYW1lPgpDYzog
TG9yZW56byBCaWFuY29uaSA8bG9yZW56by5iaWFuY29uaTgzQGdtYWlsLmNvbT4KQ2M6IFJ5ZGVy
IExlZSA8cnlkZXIubGVlQG1lZGlhdGVrLmNvbT4KQ2M6IFNoYXluZSBDaGVuIDxzaGF5bmUuY2hl
bkBtZWRpYXRlay5jb20+CkNjOiBTZWFuIFdhbmcgPHNlYW4ud2FuZ0BtZWRpYXRlay5jb20+CkNj
OiBLYWxsZSBWYWxvIDxrdmFsb0BrZXJuZWwub3JnPgpDYzogIkRhdmlkIFMuIE1pbGxlciIgPGRh
dmVtQGRhdmVtbG9mdC5uZXQ+CkNjOiBKYWt1YiBLaWNpbnNraSA8a3ViYUBrZXJuZWwub3JnPgpD
YzogbGludXgtd2lyZWxlc3NAdmdlci5rZXJuZWwub3JnCkNjOiBuZXRkZXZAdmdlci5rZXJuZWwu
b3JnClNpZ25lZC1vZmYtYnk6IEthbGxlIFZhbG8gPGt2YWxvQGtlcm5lbC5vcmc+Ckxpbms6IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL3IvMjAyMjA0MDUxNTE1MTcuMjk3NTMtOS1icEBhbGllbjgu
ZGUKU2lnbmVkLW9mZi1ieTogU2FzaGEgTGV2aW4gPHNhc2hhbEBrZXJuZWwub3JnPgotLS0KIGRy
aXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3NngyX3BjaS5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc2eDJfcGNpLmMgYi9kcml2ZXJz
L25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210NzZ4Ml9wY2kuYwppbmRleCAyNmNmZGEyNGNl
MDguLmUyNjk0N2Y4OTI5OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0
ZWsvbXQ3Ni9tdDc2eDJfcGNpLmMKKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsv
bXQ3Ni9tdDc2eDJfcGNpLmMKQEAgLTczLDcgKzczLDcgQEAgbXQ3NnBjaV9wcm9iZShzdHJ1Y3Qg
cGNpX2RldiAqcGRldiwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmlkKQogCW10NzZfcm13
X2ZpZWxkKGRldiwgMHgxNWExMCwgMHgxZiA8PCAxNiwgMHg5KTsKIAogCS8qIFJHX1NTVVNCX0cx
X0NEUl9CSUNfTFRSID0gMHhmICovCi0JbXQ3Nl9ybXdfZmllbGQoZGV2LCAweDE1YTBjLCAweGYg
PDwgMjgsIDB4Zik7CisJbXQ3Nl9ybXdfZmllbGQoZGV2LCAweDE1YTBjLCAweGZVIDw8IDI4LCAw
eGYpOwogCiAJLyogUkdfU1NVU0JfQ0RSX0JSX1BFMUQgPSAweDMgKi8KIAltdDc2X3Jtd19maWVs
ZChkZXYsIDB4MTVjNTgsIDB4MyA8PCA2LCAweDMpOwotLSAKMi4zNS4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
