Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 260E2C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 18:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IxdTzoMb9JyPztdDjXyD9MtmdLDwOCGd7Idgik65KQc=; b=nAzshcR6Txcowe
	GuP6/sZAQgUBHftKt6YIfj5qdWy+I5zSBDXSrL3XVZ16Nw5ES2NzLsC0zxpncD9nxVkLLOBGwDJX+
	mFV9q6ZGKIOGSGHDHMRoW3UsaCUP7onOtpdDNUvuAcLm4A447xce95vslDIZta+Y2Zzv26aT5oqZQ
	MYZHolIXBeR67/hcTephgGUlm9aTXRdiNcw+NXjw496bp1rJbMlwOCWYrGalCY52Pjs3qoXey82HM
	cDvtF2tLVGTTb8Q3/RE/KO15r+S2/iqF/kBY5zjqQvoVUTGx9uUjk7sDybzxL6xsgOuy/JL+ge3Qz
	8BviLeiC14oSPzeb6EQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngsXf-005eRL-Rc; Tue, 19 Apr 2022 18:25:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngsNV-005Z4W-ER; Tue, 19 Apr 2022 18:15:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F32C86135A;
 Tue, 19 Apr 2022 18:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5380DC385A7;
 Tue, 19 Apr 2022 18:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650392103;
 bh=MD2a3mTLCRYlsfqyW71MashvvoF42g9X7TNWmf2UenA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cBOc/8LTGlkBxN1bgYND8KHmcH2s7zz5GxUVLU/zuZXsWNsrMWIGQNYxNpwwPmc1R
 Q+5YYwNL2nHKg9JW4MWmhrnCo1EswoFiKW1MDHngPz4ajQeo4FBAgirSQ/cxZWcvcD
 QaM8qUxORpy+dh6IV43z0GfvNlBhcy/q0thMvBmT0o1lLIrzv9RAk2QgvJi7bj0gyI
 BUa4VNEZNlWoHtMmICabi758iZKlQnC8aJla91A81XZ8M1/tVF8/SOC83SDC5X+gat
 mQjBY3uJMUouB6WTzYaJmdI2hB0Wy6o5XsWqXcpsgTW9gaSh4gmyfVszRb9+WTkv9i
 gx2YX4nPYO7mw==
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
 matthias.bgg@gmail.com, christophe.jaillet@wanadoo.fr,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 07/14] mt76: Fix undefined behavior due to shift
 overflowing the constant
Date: Tue, 19 Apr 2022 14:14:36 -0400
Message-Id: <20220419181444.485959-7-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419181444.485959-1-sashal@kernel.org>
References: <20220419181444.485959-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_111505_569264_75883125 
X-CRM114-Status: GOOD (  12.08  )
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
aXZlcnMvbmV0L3dpcmVsZXNzL21lZGlhdGVrL210NzYvbXQ3NngyL3BjaS5jIHwgMiArLQogMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsvbXQ3Ni9tdDc2eDIvcGNpLmMgYi9kcml2ZXJz
L25ldC93aXJlbGVzcy9tZWRpYXRlay9tdDc2L210NzZ4Mi9wY2kuYwppbmRleCBjZjYxMWQxYjgx
N2MuLmU2ZDc2NDZhMGQ5YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0
ZWsvbXQ3Ni9tdDc2eDIvcGNpLmMKKysrIGIvZHJpdmVycy9uZXQvd2lyZWxlc3MvbWVkaWF0ZWsv
bXQ3Ni9tdDc2eDIvcGNpLmMKQEAgLTc2LDcgKzc2LDcgQEAgbXQ3NnBjaV9wcm9iZShzdHJ1Y3Qg
cGNpX2RldiAqcGRldiwgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgKmlkKQogCW10NzZfcm13
X2ZpZWxkKGRldiwgMHgxNWExMCwgMHgxZiA8PCAxNiwgMHg5KTsKIAogCS8qIFJHX1NTVVNCX0cx
X0NEUl9CSUNfTFRSID0gMHhmICovCi0JbXQ3Nl9ybXdfZmllbGQoZGV2LCAweDE1YTBjLCAweGYg
PDwgMjgsIDB4Zik7CisJbXQ3Nl9ybXdfZmllbGQoZGV2LCAweDE1YTBjLCAweGZVIDw8IDI4LCAw
eGYpOwogCiAJLyogUkdfU1NVU0JfQ0RSX0JSX1BFMUQgPSAweDMgKi8KIAltdDc2X3Jtd19maWVs
ZChkZXYsIDB4MTVjNTgsIDB4MyA8PCA2LCAweDMpOwotLSAKMi4zNS4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
