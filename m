Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77B0AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 10:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LBXppLqM75KbSVjNu15oXpbw7QUoaqOGhF13VbYtb8A=; b=NBMsOOx4MYoVk0
	eHv9LGC0ykEdZu/b1GgxO3Gol4GxakYzInextINsk8vOeFS4izO8gWBz1aZGmJaeWdtV/bbmqjlJ0
	XuQeWwoTZrsJiJr01+XDW1tDVwqtkMKj4fJwQi+zyXzBj9SMtIH99ZvFHhxvdWRqjB4N1j33eQ7S0
	rKi95Ymobshm0wnSHrBiKGhi0kJV5R0XiD9e9USmBBw7wcqrnSfL1pqxiCRY/OGY92x0ynf8p07Yv
	NzUWLbIbNYLnSciPO8PzJhdIyfyMdsnXy3qb+llXr1yhR1I0dop6O7TtXx4eseD/sgRL4tIKuPdmD
	eRVGXRulM3af8UmQX7rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nquju-00DCHC-Rw; Tue, 17 May 2022 10:47:42 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqujZ-00DC1i-Ir; Tue, 17 May 2022 10:47:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 39D5E1F444D7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652784437;
 bh=5vOHDRqH1zBj4kXu3ekurCYU3ZRxfiqVzKY6haFAxx4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H9OA7uP86ULXJkgz5TKuL5xuzatMyO2GbmI3IohqKZ5Op9B+nYSObnD8KF5wJEALD
 qS/0nqwGOyeNErLX98qKREfrLR3iKJyz0y5WwmwNkOikCpoM/wzuiJ7oUvkKTjDwUU
 e+hPyItMsy8r6Uh+6Yb8kgCyv/aXVA0kWQofCNV8sKFmYR0xaJXaBZ1i1+ICvM7RoU
 qWJLBzw/EMEb2bxfxxNa0owZgDlFiWCQg8/rjqApcFW2bZ6i3iWaPuoT7jGNBa2Xq5
 ITH9M7vmYdz8ixT4cVSYX7zkQYwn71UzkgFUtO+RDO0WLqn8JYP8yVhY/A7dy8yh/K
 4ASjXWpBYuMOw==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, nfraprado@collabora.com,
 rex-bc.chen@mediatek.com, zhiyong.tao@mediatek.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v4 2/5] soc: mediatek: pwrap: Switch to
 devm_platform_ioremap_resource_byname()
Date: Tue, 17 May 2022 12:47:09 +0200
Message-Id: <20220517104712.24579-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220517104712.24579-1-angelogioacchino.delregno@collabora.com>
References: <20220517104712.24579-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_034721_878384_525BEE8B 
X-CRM114-Status: GOOD (  11.25  )
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

SW4gb3JkZXIgdG8gc2ltcGxpZnkgaW9yZW1hcHBpbmcgcmVzb3VyY2VzLCBpbnN0ZWFkIG9mIGNh
bGxpbmcKcGxhdGZvcm1fZ2V0X3Jlc291cmNlX2J5bmFtZSgpIGFuZCB0aGVuIGRldm1faW9yZW1h
cF9yZXNvdXJjZSgpLApzaW1wbHkgY2FsbCBkZXZtX3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2Vf
YnluYW1lKCkuCgpTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5n
ZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgpSZXZpZXdlZC1ieTogTsOtY29s
YXMgRi4gUi4gQS4gUHJhZG8gPG5mcmFwcmFkb0Bjb2xsYWJvcmEuY29tPgpUZXN0ZWQtYnk6IE7D
rWNvbGFzIEYuIFIuIEEuIFByYWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KLS0tCiBkcml2
ZXJzL3NvYy9tZWRpYXRlay9tdGstcG1pYy13cmFwLmMgfCA4ICsrLS0tLS0tCiAxIGZpbGUgY2hh
bmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvc29jL21lZGlhdGVrL210ay1wbWljLXdyYXAuYyBiL2RyaXZlcnMvc29jL21lZGlhdGVrL210
ay1wbWljLXdyYXAuYwppbmRleCA1NGE1MzAwYWI3MmIuLjg1MjUxNDM2NmYxZiAxMDA2NDQKLS0t
IGEvZHJpdmVycy9zb2MvbWVkaWF0ZWsvbXRrLXBtaWMtd3JhcC5jCisrKyBiL2RyaXZlcnMvc29j
L21lZGlhdGVrL210ay1wbWljLXdyYXAuYwpAQCAtMjE5MSw3ICsyMTkxLDYgQEAgc3RhdGljIGlu
dCBwd3JhcF9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2KQogCXN0cnVjdCBwbWlj
X3dyYXBwZXIgKndycDsKIAlzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wID0gcGRldi0+ZGV2Lm9mX25v
ZGU7CiAJY29uc3Qgc3RydWN0IG9mX2RldmljZV9pZCAqb2Zfc2xhdmVfaWQgPSBOVUxMOwotCXN0
cnVjdCByZXNvdXJjZSAqcmVzOwogCiAJaWYgKG5wLT5jaGlsZCkKIAkJb2Zfc2xhdmVfaWQgPSBv
Zl9tYXRjaF9ub2RlKG9mX3NsYXZlX21hdGNoX3RibCwgbnAtPmNoaWxkKTsKQEAgLTIyMTEsOCAr
MjIxMCw3IEBAIHN0YXRpYyBpbnQgcHdyYXBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2RldmljZSAq
cGRldikKIAl3cnAtPnNsYXZlID0gb2Zfc2xhdmVfaWQtPmRhdGE7CiAJd3JwLT5kZXYgPSAmcGRl
di0+ZGV2OwogCi0JcmVzID0gcGxhdGZvcm1fZ2V0X3Jlc291cmNlX2J5bmFtZShwZGV2LCBJT1JF
U09VUkNFX01FTSwgInB3cmFwIik7Ci0Jd3JwLT5iYXNlID0gZGV2bV9pb3JlbWFwX3Jlc291cmNl
KHdycC0+ZGV2LCByZXMpOworCXdycC0+YmFzZSA9IGRldm1fcGxhdGZvcm1faW9yZW1hcF9yZXNv
dXJjZV9ieW5hbWUocGRldiwgInB3cmFwIik7CiAJaWYgKElTX0VSUih3cnAtPmJhc2UpKQogCQly
ZXR1cm4gUFRSX0VSUih3cnAtPmJhc2UpOwogCkBAIC0yMjI2LDkgKzIyMjQsNyBAQCBzdGF0aWMg
aW50IHB3cmFwX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCiAJfQogCiAJaWYg
KEhBU19DQVAod3JwLT5tYXN0ZXItPmNhcHMsIFBXUkFQX0NBUF9CUklER0UpKSB7Ci0JCXJlcyA9
IHBsYXRmb3JtX2dldF9yZXNvdXJjZV9ieW5hbWUocGRldiwgSU9SRVNPVVJDRV9NRU0sCi0JCQkJ
InB3cmFwLWJyaWRnZSIpOwotCQl3cnAtPmJyaWRnZV9iYXNlID0gZGV2bV9pb3JlbWFwX3Jlc291
cmNlKHdycC0+ZGV2LCByZXMpOworCQl3cnAtPmJyaWRnZV9iYXNlID0gZGV2bV9wbGF0Zm9ybV9p
b3JlbWFwX3Jlc291cmNlX2J5bmFtZShwZGV2LCAicHdyYXAtYnJpZGdlIik7CiAJCWlmIChJU19F
UlIod3JwLT5icmlkZ2VfYmFzZSkpCiAJCQlyZXR1cm4gUFRSX0VSUih3cnAtPmJyaWRnZV9iYXNl
KTsKIAotLSAKMi4zNS4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
