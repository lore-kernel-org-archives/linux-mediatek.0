Return-Path: <SRS0=7Wwy=ZY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 28920C432C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:41:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0E2520661
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Dec 2019 19:41:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h6oUR4bE";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NXrsvTVy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0E2520661
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yV0wm9NNxzx2murjyVLVb1FiUPdAIuGMsxmOreV8McA=; b=h6oUR4bE6nykQE
	Bt36t1plVkIy360d0wfODP6PEDyANjc7lVNhHO7QjlDqI3zw1g/0F0iAXt65cO59A+ilUt7xAKWV6
	KGq/8RSHO9w3ccOj6JPtDXhx3LCOAM0ZwxM1VXHul6NVVVhTQuRTYViniuAGOKp7XtClew6JG1sbn
	Nn/S5f8K7exL89ATOg4phdoKJjOVZF36AVB06UUm5KNKiguf5JJ6LIeCAZCfleMcE06Fxy0q1sah/
	vETssmg5E0E84eKydvq/lps7fAZSQfFNljAIxSVPZeuZ7xO8lseWOyH5QYJFFUpDAoeqEmqSmWmhW
	7h5oRa9fBri0GzoPzhbQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ibrZF-0000ER-8m; Mon, 02 Dec 2019 19:41:09 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ibrS0-0007nX-Jh; Mon, 02 Dec 2019 19:33:44 +0000
Received: by mail-lj1-x244.google.com with SMTP id d20so778892ljc.12;
 Mon, 02 Dec 2019 11:33:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9l88xihpsr+Oq7AiOCDQfFuIMQfThGtVnWiYKe7NjT4=;
 b=NXrsvTVyKTVDN70+OK/7PF45HUHG5iMhS69DUkYT2xofsK/0mFMX5121dT/vftSM7R
 qpWNdC7qTqqXqAThmb+h5aQ9rm2oVx2VUbwhav5ehLUT6ffVSkzCmxdk4CfDL/Ex4G0W
 SodcXhFAjBSa16VNI+zM+1tj8zgBvTgKX4T3rTKedBUL8+Bsk3ogVw4MlixwlgKh4M8T
 Q02q2gq4vhycml3qIipLMtXIqfBm0UWXxBQzF6UdxFcxXL4UsH1fWSnPj+ZEP61vy2cu
 Wpp3fOUqsu8zeLeEcGbwxyDwq7ejHwvJ/M+G1AKiP/8ZbX/Gu9jjG75b0nywoWL8Pg5J
 dzLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=9l88xihpsr+Oq7AiOCDQfFuIMQfThGtVnWiYKe7NjT4=;
 b=lljNxPCofNsMP8q4ydjIx+fNaPl7pA7ItYkDIazq0XDA2PiGoX9sH8BvRZTZB1UAF2
 BIN8a/POpK7szzUTl4oZeKEr37dSQ+LjABKvRCy1xAFSpUbP1NIW8iHRbSixKytxX/kT
 SWL1hbfcRm9tXub/2hSN2n/yKsF/PJ4+4aokLhDEOIcuMiWcghHFmIOkzHSqidTDxlfF
 t27z1dFtlA4nfbUXwknmNvGSlOpcfpf+R7TGEjA5qpl2mHXqeULmRTOF3uh8i1DgWKPR
 UAIlDc+QuwX1MWSMN3BgrUZ40VdFu4b1PNs8L+zm+tLfN8K0StSKsP1kBRVJqS0To5rv
 HEhA==
X-Gm-Message-State: APjAAAX6D9JwYJ98egH5tbL3TO09GmlV5RopNeaH3i1UY6/sa9Ccpjmu
 CdxwYuDdf/how3mmK5S+bTo=
X-Google-Smtp-Source: APXvYqzS7SokA6A/WeeKZw1vsjDaKZ/zMqV2/WXPSZ5E+ZDr9kYmre74jF/nrnnSX3bYrjhN+JwTpg==
X-Received: by 2002:a2e:b5ae:: with SMTP id f14mr256760ljn.31.1575315218380;
 Mon, 02 Dec 2019 11:33:38 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 g13sm79482lfb.74.2019.12.02.11.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2019 11:33:37 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: [PATCH v1 18/26] drm/panel: rocktech-jh057n00900: use drm_panel
 backlight support
Date: Mon,  2 Dec 2019 20:32:22 +0100
Message-Id: <20191202193230.21310-19-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191202193230.21310-1-sam@ravnborg.org>
References: <20191202193230.21310-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191202_113340_689970_FA564860 
X-CRM114-Status: GOOD (  12.21  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Linus Walleij <linus.walleij@linaro.org>, Stefan Agner <stefan@agner.ch>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, linux-samsung-soc@vger.kernel.org,
 linux-rockchip@lists.infradead.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 NXP Linux Team <linux-imx@nxp.com>, Jitao Shi <jitao.shi@mediatek.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-tegra@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Purism Kernel Team <kernel@puri.sm>, linux-renesas-soc@vger.kernel.org,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

VXNlIHRoZSBiYWNrbGlnaHQgc3VwcG9ydCBpbiBkcm1fcGFuZWwgdG8gc2ltcGxpZnkgdGhlIGRy
aXZlci4KV2hpbGUgdG91Y2hpbmcgdGhlIGluY2x1ZGUgZmlsZXMgc29ydCB0aGVtCmFuZCBkaXZp
ZGUgdGhlbSB1cCBpbiBibG9ja3MuCgpTaWduZWQtb2ZmLWJ5OiBTYW0gUmF2bmJvcmcgPHNhbUBy
YXZuYm9yZy5vcmc+CkNjOiAiR3VpZG8gR8O8bnRoZXIiIDxhZ3hAc2lneGNwdS5vcmc+CkNjOiBQ
dXJpc20gS2VybmVsIFRlYW0gPGtlcm5lbEBwdXJpLnNtPgpDYzogVGhpZXJyeSBSZWRpbmcgPHRo
aWVycnkucmVkaW5nQGdtYWlsLmNvbT4KQ2M6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9y
Zz4KLS0tCiAuLi4vZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAwLmMgICAgfCAy
NCArKysrKysrKystLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTIgaW5zZXJ0aW9ucygrKSwg
MTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVs
LXJvY2t0ZWNoLWpoMDU3bjAwOTAwLmMgYi9kcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtcm9j
a3RlY2gtamgwNTduMDA5MDAuYwppbmRleCAzYTRmMWMwZmNlODYuLjM4ZmY3NDJiYzEyMCAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAw
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAw
LmMKQEAgLTUsMjAgKzUsMjIgQEAKICAqIENvcHlyaWdodCAoQykgUHVyaXNtIFNQQyAyMDE5CiAg
Ki8KIAotI2luY2x1ZGUgPGRybS9kcm1fbWlwaV9kc2kuaD4KLSNpbmNsdWRlIDxkcm0vZHJtX21v
ZGVzLmg+Ci0jaW5jbHVkZSA8ZHJtL2RybV9wYW5lbC5oPgotI2luY2x1ZGUgPGRybS9kcm1fcHJp
bnQuaD4KLSNpbmNsdWRlIDxsaW51eC9iYWNrbGlnaHQuaD4KICNpbmNsdWRlIDxsaW51eC9kZWJ1
Z2ZzLmg+CiAjaW5jbHVkZSA8bGludXgvZGVsYXkuaD4KICNpbmNsdWRlIDxsaW51eC9ncGlvL2Nv
bnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvbWVkaWEtYnVzLWZvcm1hdC5oPgorI2luY2x1ZGUg
PGxpbnV4L21vZF9kZXZpY2V0YWJsZS5oPgogI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5oPgogI2lu
Y2x1ZGUgPGxpbnV4L3JlZ3VsYXRvci9jb25zdW1lci5oPgorCiAjaW5jbHVkZSA8dmlkZW8vZGlz
cGxheV90aW1pbmcuaD4KICNpbmNsdWRlIDx2aWRlby9taXBpX2Rpc3BsYXkuaD4KIAorI2luY2x1
ZGUgPGRybS9kcm1fbWlwaV9kc2kuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX21vZGVzLmg+CisjaW5j
bHVkZSA8ZHJtL2RybV9wYW5lbC5oPgorI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KKwogI2Rl
ZmluZSBEUlZfTkFNRSAicGFuZWwtcm9ja3RlY2gtamgwNTduMDA5MDAiCiAKIC8qIE1hbnVmYWN0
dXJlciBzcGVjaWZpYyBDb21tYW5kcyBzZW5kIHZpYSBEU0kgKi8KQEAgLTQ3LDcgKzQ5LDYgQEAg
c3RydWN0IGpoMDU3biB7CiAJc3RydWN0IGRldmljZSAqZGV2OwogCXN0cnVjdCBkcm1fcGFuZWwg
cGFuZWw7CiAJc3RydWN0IGdwaW9fZGVzYyAqcmVzZXRfZ3BpbzsKLQlzdHJ1Y3QgYmFja2xpZ2h0
X2RldmljZSAqYmFja2xpZ2h0OwogCXN0cnVjdCByZWd1bGF0b3IgKnZjYzsKIAlzdHJ1Y3QgcmVn
dWxhdG9yICppb3ZjYzsKIAlib29sIHByZXBhcmVkOwpAQCAtMTUyLDcgKzE1Myw3IEBAIHN0YXRp
YyBpbnQgamgwNTduX2VuYWJsZShzdHJ1Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAkJcmV0dXJuIHJl
dDsKIAl9CiAKLQlyZXR1cm4gYmFja2xpZ2h0X2VuYWJsZShjdHgtPmJhY2tsaWdodCk7CisJcmV0
dXJuIDA7CiB9CiAKIHN0YXRpYyBpbnQgamgwNTduX2Rpc2FibGUoc3RydWN0IGRybV9wYW5lbCAq
cGFuZWwpCkBAIC0xNjAsNyArMTYxLDYgQEAgc3RhdGljIGludCBqaDA1N25fZGlzYWJsZShzdHJ1
Y3QgZHJtX3BhbmVsICpwYW5lbCkKIAlzdHJ1Y3QgamgwNTduICpjdHggPSBwYW5lbF90b19qaDA1
N24ocGFuZWwpOwogCXN0cnVjdCBtaXBpX2RzaV9kZXZpY2UgKmRzaSA9IHRvX21pcGlfZHNpX2Rl
dmljZShjdHgtPmRldik7CiAKLQliYWNrbGlnaHRfZGlzYWJsZShjdHgtPmJhY2tsaWdodCk7CiAJ
cmV0dXJuIG1pcGlfZHNpX2Rjc19zZXRfZGlzcGxheV9vZmYoZHNpKTsKIH0KIApAQCAtMzIxLDEw
ICszMjEsNiBAQCBzdGF0aWMgaW50IGpoMDU3bl9wcm9iZShzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNl
ICpkc2kpCiAJZHNpLT5tb2RlX2ZsYWdzID0gTUlQSV9EU0lfTU9ERV9WSURFTyB8CiAJCU1JUElf
RFNJX01PREVfVklERU9fQlVSU1QgfCBNSVBJX0RTSV9NT0RFX1ZJREVPX1NZTkNfUFVMU0U7CiAK
LQljdHgtPmJhY2tsaWdodCA9IGRldm1fb2ZfZmluZF9iYWNrbGlnaHQoZGV2KTsKLQlpZiAoSVNf
RVJSKGN0eC0+YmFja2xpZ2h0KSkKLQkJcmV0dXJuIFBUUl9FUlIoY3R4LT5iYWNrbGlnaHQpOwot
CiAJY3R4LT52Y2MgPSBkZXZtX3JlZ3VsYXRvcl9nZXQoZGV2LCAidmNjIik7CiAJaWYgKElTX0VS
UihjdHgtPnZjYykpIHsKIAkJcmV0ID0gUFRSX0VSUihjdHgtPnZjYyk7CkBAIC0zNDcsNiArMzQz
LDEwIEBAIHN0YXRpYyBpbnQgamgwNTduX3Byb2JlKHN0cnVjdCBtaXBpX2RzaV9kZXZpY2UgKmRz
aSkKIAlkcm1fcGFuZWxfaW5pdCgmY3R4LT5wYW5lbCwgZGV2LCAmamgwNTduX2RybV9mdW5jcywK
IAkJICAgICAgIERSTV9NT0RFX0NPTk5FQ1RPUl9EU0kpOwogCisJcmV0ID0gZHJtX3BhbmVsX29m
X2JhY2tsaWdodCgmY3R4LT5wYW5lbCk7CisJaWYgKHJldCkKKwkJcmV0dXJuIHJldDsKKwogCWRy
bV9wYW5lbF9hZGQoJmN0eC0+cGFuZWwpOwogCiAJcmV0ID0gbWlwaV9kc2lfYXR0YWNoKGRzaSk7
Ci0tIAoyLjIwLjEKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LW1lZGlhdGVrCg==
