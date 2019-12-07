Return-Path: <SRS0=LwTv=Z5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1DC4C43603
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 14:12:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 98E6B24677
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 14:12:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dRci7FNb";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cZTvjGkj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 98E6B24677
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ravnborg.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=coOaAYZQK0xHdZh0s+SRPmxB9eSjO2vLvYvYDmdRGV0=; b=dRci7FNbAy0hSL
	5vIrC7yXYPw7VeRt0J72itAJiip7PgxeXEy+mhRE3ppQ+Jcho6fWVCxkDZgRJ4dv96uaB61FmzU89
	asFzlnIlxhScTpf6kxdnbSV28xOTAk2y+XD5TRR+FhZVKDDnl9n5coSvsrg6I4L5zSpqZOrKoaUp6
	6sVkdTR5OGxvY4dDJLOhIfMsz/lPOc2tCkPSY4dzIwyG3le3UAOg4HxmHuqNlbEqu7XIA4Lyd+I9L
	ggkrToLJOO7bOPQICQGwucQ8Savu3fLYA0HjvQw6zQ1iVJImlXIqiG9rGdd90lCkAHgFsXq8XXKa3
	aNbFIVn5RGQimrWCdb7w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1idaoF-0006JZ-Iv; Sat, 07 Dec 2019 14:11:47 +0000
Received: from mail-lf1-x144.google.com ([2a00:1450:4864:20::144])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idahO-0005qK-T9; Sat, 07 Dec 2019 14:04:46 +0000
Received: by mail-lf1-x144.google.com with SMTP id l18so7432867lfc.1;
 Sat, 07 Dec 2019 06:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VaBvhdhNtObbqsxPerTgXU57K3m4iUiAmX6XWjRdma8=;
 b=cZTvjGkjrfyjv3XvlFQLZd1fBYvUwA2F7rgXxqR3m5nmg4z4VuWhpUyxwuWV5mLHFW
 EdupZomTGwmdPvT58sN7eRALuAXX1G0Nf92Bt0sdGN7fHTxOx7iUT0HS0GMmbu4ySvtw
 z1MUgMzIaR7Bwp2VeOeHbW+y77pfYovpN7W+UV2JENCEMJ1WGIHs4myc1V5VnsO2AiKE
 2tga/sY6fV6bOSKUJ3nKwOYkXHC1SOsy0XuCyXv/SWN3wThH9FXB/1CboBK4SmOHKKmO
 SPscZrSICFYQIb1PpbDJJ10R9p2xTo/OvSCjOU7YcPTtvqZD2jvRDV1/q6CSOmLuOh1R
 ldUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=VaBvhdhNtObbqsxPerTgXU57K3m4iUiAmX6XWjRdma8=;
 b=qx1nrcZnask0Zh9IAHEyJTe/wdjrVFQbRLI2vJmTv4aagZeMcxzeeKtSy00si4jDQh
 ckFwRdVNELQC3qL6oEGTMsD75j7WVb/Nawg7wuFK7ldv2MdsPTM6TD7V2joskCxpdvjW
 g7QEGrFgCKpEUT6sL45w52zZVbliZhz0Ae7eYeFcUNAycCewRA8J8MZxWuiVLWkKnm7X
 R6RvlK6G5YTLqmE9OnkeLRtZ4uTTfkL3OTp5MgcOnZ0NgHRivyxHzyCBSTNBkxw+Yjta
 bxvv73Yy09vJcHYNcFrKyROmQOTP+6F7SqQNwsnlt8xYRhCv+Lnt+seNx83NcYbLFZlT
 QAFw==
X-Gm-Message-State: APjAAAXIFd7nPmBlnZCOBw3ybQvB672u14VjKEjDXAzeqb/KDJFb7PD3
 NduoJhYpqk8fOt7ia2PjgTs=
X-Google-Smtp-Source: APXvYqwM0erZxo6LOlySak2aMfBaSTmHMVITDmR/sT0HyMLyvaaqCnJATLGaFQPO9c/qhW5jo19sYg==
X-Received: by 2002:a19:ac08:: with SMTP id g8mr11551704lfc.112.1575727480871; 
 Sat, 07 Dec 2019 06:04:40 -0800 (PST)
Received: from saturn.lan (18.158-248-194.customer.lyse.net. [158.248.194.18])
 by smtp.gmail.com with ESMTPSA id
 w17sm5644188lfn.22.2019.12.07.06.04.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Dec 2019 06:04:40 -0800 (PST)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH v2 17/25] drm/panel: rocktech-jh057n00900: use drm_panel
 backlight support
Date: Sat,  7 Dec 2019 15:03:45 +0100
Message-Id: <20191207140353.23967-18-sam@ravnborg.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191207140353.23967-1-sam@ravnborg.org>
References: <20191207140353.23967-1-sam@ravnborg.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191207_060443_142559_BB4C79A5 
X-CRM114-Status: GOOD (  11.90  )
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
 =?UTF-8?q?Guido=20G=C3=BCnther?= <agx@sigxcpu.org>,
 Stefan Agner <stefan@agner.ch>, Andrzej Hajda <a.hajda@samsung.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jagan Teki <jagan@amarulasolutions.com>, NXP Linux Team <linux-imx@nxp.com>,
 Jitao Shi <jitao.shi@mediatek.com>,
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
YXZuYm9yZy5vcmc+ClJldmlld2VkLWJ5OiBHdWlkbyBHw7xudGhlciA8YWd4QHNpZ3hjcHUub3Jn
PgpSZXZpZXdlZC1ieTogTGF1cmVudCBQaW5jaGFydCA8bGF1cmVudC5waW5jaGFydEBpZGVhc29u
Ym9hcmQuY29tPgpDYzogIkd1aWRvIEfDvG50aGVyIiA8YWd4QHNpZ3hjcHUub3JnPgpDYzogUHVy
aXNtIEtlcm5lbCBUZWFtIDxrZXJuZWxAcHVyaS5zbT4KQ2M6IFRoaWVycnkgUmVkaW5nIDx0aGll
cnJ5LnJlZGluZ0BnbWFpbC5jb20+CkNjOiBTYW0gUmF2bmJvcmcgPHNhbUByYXZuYm9yZy5vcmc+
Ci0tLQogLi4uL2RybS9wYW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5jICAgIHwgMjQg
KysrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDEy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1y
b2NrdGVjaC1qaDA1N24wMDkwMC5jIGIvZHJpdmVycy9ncHUvZHJtL3BhbmVsL3BhbmVsLXJvY2t0
ZWNoLWpoMDU3bjAwOTAwLmMKaW5kZXggM2E0ZjFjMGZjZTg2Li4zOGZmNzQyYmMxMjAgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1yb2NrdGVjaC1qaDA1N24wMDkwMC5j
CkBAIC01LDIwICs1LDIyIEBACiAgKiBDb3B5cmlnaHQgKEMpIFB1cmlzbSBTUEMgMjAxOQogICov
CiAKLSNpbmNsdWRlIDxkcm0vZHJtX21pcGlfZHNpLmg+Ci0jaW5jbHVkZSA8ZHJtL2RybV9tb2Rl
cy5oPgotI2luY2x1ZGUgPGRybS9kcm1fcGFuZWwuaD4KLSNpbmNsdWRlIDxkcm0vZHJtX3ByaW50
Lmg+Ci0jaW5jbHVkZSA8bGludXgvYmFja2xpZ2h0Lmg+CiAjaW5jbHVkZSA8bGludXgvZGVidWdm
cy5oPgogI2luY2x1ZGUgPGxpbnV4L2RlbGF5Lmg+CiAjaW5jbHVkZSA8bGludXgvZ3Bpby9jb25z
dW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L21lZGlhLWJ1cy1mb3JtYXQuaD4KKyNpbmNsdWRlIDxs
aW51eC9tb2RfZGV2aWNldGFibGUuaD4KICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KICNpbmNs
dWRlIDxsaW51eC9yZWd1bGF0b3IvY29uc3VtZXIuaD4KKwogI2luY2x1ZGUgPHZpZGVvL2Rpc3Bs
YXlfdGltaW5nLmg+CiAjaW5jbHVkZSA8dmlkZW8vbWlwaV9kaXNwbGF5Lmg+CiAKKyNpbmNsdWRl
IDxkcm0vZHJtX21pcGlfZHNpLmg+CisjaW5jbHVkZSA8ZHJtL2RybV9tb2Rlcy5oPgorI2luY2x1
ZGUgPGRybS9kcm1fcGFuZWwuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+CisKICNkZWZp
bmUgRFJWX05BTUUgInBhbmVsLXJvY2t0ZWNoLWpoMDU3bjAwOTAwIgogCiAvKiBNYW51ZmFjdHVy
ZXIgc3BlY2lmaWMgQ29tbWFuZHMgc2VuZCB2aWEgRFNJICovCkBAIC00Nyw3ICs0OSw2IEBAIHN0
cnVjdCBqaDA1N24gewogCXN0cnVjdCBkZXZpY2UgKmRldjsKIAlzdHJ1Y3QgZHJtX3BhbmVsIHBh
bmVsOwogCXN0cnVjdCBncGlvX2Rlc2MgKnJlc2V0X2dwaW87Ci0Jc3RydWN0IGJhY2tsaWdodF9k
ZXZpY2UgKmJhY2tsaWdodDsKIAlzdHJ1Y3QgcmVndWxhdG9yICp2Y2M7CiAJc3RydWN0IHJlZ3Vs
YXRvciAqaW92Y2M7CiAJYm9vbCBwcmVwYXJlZDsKQEAgLTE1Miw3ICsxNTMsNyBAQCBzdGF0aWMg
aW50IGpoMDU3bl9lbmFibGUoc3RydWN0IGRybV9wYW5lbCAqcGFuZWwpCiAJCXJldHVybiByZXQ7
CiAJfQogCi0JcmV0dXJuIGJhY2tsaWdodF9lbmFibGUoY3R4LT5iYWNrbGlnaHQpOworCXJldHVy
biAwOwogfQogCiBzdGF0aWMgaW50IGpoMDU3bl9kaXNhYmxlKHN0cnVjdCBkcm1fcGFuZWwgKnBh
bmVsKQpAQCAtMTYwLDcgKzE2MSw2IEBAIHN0YXRpYyBpbnQgamgwNTduX2Rpc2FibGUoc3RydWN0
IGRybV9wYW5lbCAqcGFuZWwpCiAJc3RydWN0IGpoMDU3biAqY3R4ID0gcGFuZWxfdG9famgwNTdu
KHBhbmVsKTsKIAlzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2kgPSB0b19taXBpX2RzaV9kZXZp
Y2UoY3R4LT5kZXYpOwogCi0JYmFja2xpZ2h0X2Rpc2FibGUoY3R4LT5iYWNrbGlnaHQpOwogCXJl
dHVybiBtaXBpX2RzaV9kY3Nfc2V0X2Rpc3BsYXlfb2ZmKGRzaSk7CiB9CiAKQEAgLTMyMSwxMCAr
MzIxLDYgQEAgc3RhdGljIGludCBqaDA1N25fcHJvYmUoc3RydWN0IG1pcGlfZHNpX2RldmljZSAq
ZHNpKQogCWRzaS0+bW9kZV9mbGFncyA9IE1JUElfRFNJX01PREVfVklERU8gfAogCQlNSVBJX0RT
SV9NT0RFX1ZJREVPX0JVUlNUIHwgTUlQSV9EU0lfTU9ERV9WSURFT19TWU5DX1BVTFNFOwogCi0J
Y3R4LT5iYWNrbGlnaHQgPSBkZXZtX29mX2ZpbmRfYmFja2xpZ2h0KGRldik7Ci0JaWYgKElTX0VS
UihjdHgtPmJhY2tsaWdodCkpCi0JCXJldHVybiBQVFJfRVJSKGN0eC0+YmFja2xpZ2h0KTsKLQog
CWN0eC0+dmNjID0gZGV2bV9yZWd1bGF0b3JfZ2V0KGRldiwgInZjYyIpOwogCWlmIChJU19FUlIo
Y3R4LT52Y2MpKSB7CiAJCXJldCA9IFBUUl9FUlIoY3R4LT52Y2MpOwpAQCAtMzQ3LDYgKzM0Mywx
MCBAQCBzdGF0aWMgaW50IGpoMDU3bl9wcm9iZShzdHJ1Y3QgbWlwaV9kc2lfZGV2aWNlICpkc2kp
CiAJZHJtX3BhbmVsX2luaXQoJmN0eC0+cGFuZWwsIGRldiwgJmpoMDU3bl9kcm1fZnVuY3MsCiAJ
CSAgICAgICBEUk1fTU9ERV9DT05ORUNUT1JfRFNJKTsKIAorCXJldCA9IGRybV9wYW5lbF9vZl9i
YWNrbGlnaHQoJmN0eC0+cGFuZWwpOworCWlmIChyZXQpCisJCXJldHVybiByZXQ7CisKIAlkcm1f
cGFuZWxfYWRkKCZjdHgtPnBhbmVsKTsKIAogCXJldCA9IG1pcGlfZHNpX2F0dGFjaChkc2kpOwot
LSAKMi4yMC4xCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
