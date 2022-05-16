Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BADBC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 May 2022 12:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4KF6ACgKcjXA9IU8I6rmd3xezOhHYCX0qCWWEs4Xci8=; b=nYmGsCRnYA7BM9
	VLwN5bKwYY0tyc+H0Pmrun/paPx7f81SIi1XVlawtxqOk+C9EhsaOeR//kBOJudWG2DwPo17nBaOV
	t+/UUp6G13hBfYX77KPrB3+V3FPK34ce7zEHVZ3TrpnmzitR0zAIuPMzR+mSqCLL+VmTYDEKxT28c
	HcdBKJGPa8D3JmXqV79KfCJxpy5637uCa0SkMnlJ9VJeCMMKJc1ybh0TlQOsnjS6vK5KQmk+RFQ2v
	V7UbTTCi31ujf8YUW7hTbzAJwXxePRgwxp85cabLbIgFc6/nej7qKOEBZaxmaz1jhM+PTof2RTNgP
	m5UmUFf2gjSeyUxlT5oQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqa8K-007gtZ-TL; Mon, 16 May 2022 12:47:32 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqa7y-007gl6-FF; Mon, 16 May 2022 12:47:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 1A38C1F42F4F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652705226;
 bh=WLVrWccIwGrbjarjl1t+zyyFEO23qLIaLUG4z1ooZTI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N/45Ky2Bk30/JnJ2vUjgK4WzlqnlOVSDfJtgeEGMSTjv/55mkln5smG4KTTHWfhgu
 pWQBtCB85Rg2nO7BbzQSDWMKy2dZc8eDFdsh+s9jzqW9dpzCRc5PGNOjpn0Wfy6Aa/
 P0LynZiL1WiX9+H2jxRxFbXoM/mZYyCqtN6XJLFfKFYv+tG5fMM+K5drluDtB7uGAb
 EmkAvAfwvsO6nnj7kzJAuS+fwQyGH5bVcEficPMC5jSKpSsGB4KBaa4UiQfNd6nssV
 ghs/KknjjvMXkmRDnIzRkURSMUfHszGoKsi9q/BuEWNOhFLwXHmLVCQmu+kxT9zDqD
 4VSrgGl3G43kA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 rex-bc.chen@mediatek.com, zhiyong.tao@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v3 3/5] soc: mediatek: pwrap: Move and check return value of
 platform_get_irq()
Date: Mon, 16 May 2022 14:46:57 +0200
Message-Id: <20220516124659.69484-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220516124659.69484-1-angelogioacchino.delregno@collabora.com>
References: <20220516124659.69484-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220516_054710_810714_83C5CB6E 
X-CRM114-Status: GOOD (  14.74  )
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

TW92ZSB0aGUgY2FsbCB0byBwbGF0Zm9ybV9nZXRfaXJxKCkgZWFybGllciBpbiB0aGUgcHJvYmUg
ZnVuY3Rpb24KYW5kIGNoZWNrIGZvciBpdHMgcmV0dXJuIHZhbHVlOiBpZiBubyBpbnRlcnJ1cHQg
aXMgc3BlY2lmaWVkLCBpdAp3b3VsZG4ndCBtYWtlIHNlbnNlIHRvIHRyeSB0byBjYWxsIGRldm1f
cmVxdWVzdF9pcnEoKSBzbywgaW4gdGhhdApjYXNlLCB3ZSBjYW4gc2ltcGx5IHJldHVybiBlYXJs
eS4KCk1vdmluZyB0aGUgcGxhdGZvcm1fZ2V0X2lycSgpIGNhbGwgYWxzbyBtYWtlcyBpdCBwb3Nz
aWJsZSB0byB1c2UKb25lIGxlc3MgZ290bywgYXMgY2xvY2tzIGFyZW4ndCByZXF1aXJlZCBhdCB0
aGF0IHN0YWdlLgoKU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlubyBEZWwgUmVnbm8gPGFu
Z2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KUmV2aWV3ZWQtYnk6IE7DrWNv
bGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KVGVzdGVkLWJ5OiBO
w61jb2xhcyBGLiBSLiBBLiBQcmFkbyA8bmZyYXByYWRvQGNvbGxhYm9yYS5jb20+Ci0tLQogZHJp
dmVycy9zb2MvbWVkaWF0ZWsvbXRrLXBtaWMtd3JhcC5jIHwgNSArKysrLQogMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMv
c29jL21lZGlhdGVrL210ay1wbWljLXdyYXAuYyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210ay1w
bWljLXdyYXAuYwppbmRleCA4NTI1MTQzNjZmMWYuLjMzMmNiY2FiYzI5OSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLXBtaWMtd3JhcC5jCisrKyBiL2RyaXZlcnMvc29jL21l
ZGlhdGVrL210ay1wbWljLXdyYXAuYwpAQCAtMjIwNCw2ICsyMjA0LDEwIEBAIHN0YXRpYyBpbnQg
cHdyYXBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAqcGRldikKIAlpZiAoIXdycCkKIAkJ
cmV0dXJuIC1FTk9NRU07CiAKKwlpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYsIDApOworCWlm
IChpcnEgPCAwKQorCQlyZXR1cm4gaXJxOworCiAJcGxhdGZvcm1fc2V0X2RydmRhdGEocGRldiwg
d3JwKTsKIAogCXdycC0+bWFzdGVyID0gb2ZfZGV2aWNlX2dldF9tYXRjaF9kYXRhKCZwZGV2LT5k
ZXYpOwpAQCAtMjMxNiw3ICsyMzIwLDYgQEAgc3RhdGljIGludCBwd3JhcF9wcm9iZShzdHJ1Y3Qg
cGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCWlmIChIQVNfQ0FQKHdycC0+bWFzdGVyLT5jYXBzLCBQ
V1JBUF9DQVBfSU5UMV9FTikpCiAJCXB3cmFwX3dyaXRlbCh3cnAsIHdycC0+bWFzdGVyLT5pbnQx
X2VuX2FsbCwgUFdSQVBfSU5UMV9FTik7CiAKLQlpcnEgPSBwbGF0Zm9ybV9nZXRfaXJxKHBkZXYs
IDApOwogCXJldCA9IGRldm1fcmVxdWVzdF9pcnEod3JwLT5kZXYsIGlycSwgcHdyYXBfaW50ZXJy
dXB0LAogCQkJICAgICAgIElSUUZfVFJJR0dFUl9ISUdILAogCQkJICAgICAgICJtdC1wbWljLXB3
cmFwIiwgd3JwKTsKLS0gCjIuMzUuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRl
a0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
