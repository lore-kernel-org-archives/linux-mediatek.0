Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F0FDC433F2
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 14:50:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C9BD2082F
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 14:50:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vsTOU2K2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WjClSL1n"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C9BD2082F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CfM4YPz6cq7UO+ePMSyHxHRUWCn1/QFAtMevMvJ3iAI=; b=vsTOU2K2f3Or+4ai8d/J5aA2f
	kRTv5SH1s5lOeSbKMck1joloHB1Js3dyetbpDylEJOorVYMMwWheQw5fk8Jz/D07pH3MZtFBjBRRp
	eRHqtFZeYyqcJMruwEDzt+JVnCAB2BetDUlbbgOD4m6EEP9BRhb2SLr9xnYH81wqtdA/E09gInYVY
	zyeEDmMijRBEOhSpVnJM7ukFS+VgEz68+K6wwGhQLRDZ1vc53vSlXA+SR/6UZwn7nv2AuJ1t3diWP
	YV+iHPJ5gGGkWG18Qld/lah9tshmfn42laXTk4weA0tIspxlmhEEDyiHxihQOJoQT6focAZs9yKLU
	KcBb/aVcQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1juzm8-0006aT-L3; Mon, 13 Jul 2020 14:49:48 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1juzm5-0006Yq-4R
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 14:49:46 +0000
Received: by mail-wm1-x342.google.com with SMTP id a6so180153wmm.0
 for <linux-mediatek@lists.infradead.org>; Mon, 13 Jul 2020 07:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4tW5IFgDDqy7qyYDWJ2VHhOu5cDN/GOhkX5hDm+X0KA=;
 b=WjClSL1n2aF+iDQnyRNBBuqCOZEhWicWvABW9Y8n0ov9NCQi2T/5ZDyNbEbMC7NP4L
 gLKJ/VyZFokhHMKwL1I5ZkRbNsutDxl40DWjr7FLj53d0G3Uc4v/jZvzcCgJa7RAaa78
 X/gvNjcxjE3WvbULnI1iDQKcK7NBquO/2uRMuBzxL+zDjXbwCOs6xEHHiURiyeiZFbLh
 dIIEYNY38n3ovFlJHQCXVnRuIbfvoCaUwGoEVhgzxpuhPwMs+jOKfKNn5T02n9JrJRs3
 6VVnu31yidyKhClTtm7F1yqAh6E+hTVa2ZoJLWSP1fgL3/Xk0L6mPHWs2TP09tsqcWSS
 24kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4tW5IFgDDqy7qyYDWJ2VHhOu5cDN/GOhkX5hDm+X0KA=;
 b=Vc79l/hsnA4MjrtNQRf/Xi8iEkdL62QA/JkAqIwo2l2rcspyZV/ljS6McskKICprwq
 HC3C0AHq4KzeYu8aDxnhjw9wuKLvBr656ITSwiqpcQfwfKf9leYhDh/GRDEq+INhhK30
 m737Lm4WbOdL2UNm4h1n/LYldOgUC2QPrXcTHWkG+v7v0W5hWbd/d7nLv275g4KDFumN
 omMHrevP4SEYIBzFdcL/Iu4RP9KlZVy0Tv3M7gHQ5jdnERDOUvnJ6fU5ghQ6pfkmXSFe
 11c//X09VPYemNCGtWue+EBObNqz4GWg2gyHf+thOjm8z/CR+qyWJYyOhyeGAhJMP7XI
 I9vA==
X-Gm-Message-State: AOAM533TVozaMCUrRF1uB6cNi0mQ+2AmDDe+qhLTU/za7U2IGiOadW3o
 s3KYpo+lip4uuQrCoS71EyR9eg==
X-Google-Smtp-Source: ABdhPJy3KLnpKINijttBB8YhzPj7oorwUByKOTrROJQQy1EK6e62RsYUX/R0V2tT2CZQ54QxZ8iOCQ==
X-Received: by 2002:a1c:3546:: with SMTP id c67mr329914wma.102.1594651783867; 
 Mon, 13 Jul 2020 07:49:43 -0700 (PDT)
Received: from localhost.localdomain ([2.31.163.6])
 by smtp.gmail.com with ESMTPSA id o29sm26207756wra.5.2020.07.13.07.49.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 07:49:43 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linus.walleij@linaro.org
Subject: [PATCH 10/25] pinctrl: mediatek: pinctrl-mtk-common-v2: Mark
 'mtk_default_register_base_names' as __maybe_unused
Date: Mon, 13 Jul 2020 15:49:15 +0100
Message-Id: <20200713144930.1034632-11-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200713144930.1034632-1-lee.jones@linaro.org>
References: <20200713144930.1034632-1-lee.jones@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_104945_216145_0769B0E1 
X-CRM114-Status: GOOD (  13.52  )
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
Cc: Sean Wang <sean.wang@kernel.org>, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Tm90IGFsbCBzb3VyY2VmaWxlcyB3aGljaCBlbmQgdXAgaW5jbHVkaW5nIHBpbmN0cmwtbXRrLWNv
bW1vbi12Mi5oIG1ha2UgdXNlCm9mICdtdGtfZGVmYXVsdF9yZWdpc3Rlcl9iYXNlX25hbWVzJyBh
bmQgdGhlcmUgaXMgbm93aGVyZSB3ZSBjYW4gcGxhY2UgdGhlCmRlZmluaXRpb24gdG8gdm9pZCB0
aGUgbmVlZCBmb3IgX19tYXliZV91bnVzZWQgZXhjZXB0IGl0cyBvd24gaGVhZGVyZmlsZSwKd2hp
Y2ggc2VlbXMgbGlrZSBvdmVya2lsbC4gIFNvIGluc3RlYWQgd2UgdGVsbCB0aGUgY29tcGlsZXIg
dGhhdCBpdCdzIG9rYXkKZm9yIGl0IHRvIGJlIHVudXNlZCBieSBzb21lIG9mIHRoZSBjb25zdW1l
cnMuCgpGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQgd2FybmluZyhzKToKCiBJ
biBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRr
LWNvbW1vbi12Mi5jOjE5OgogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNv
bW1vbi12Mi5oOjgzOjI3OiB3YXJuaW5nOiDigJhtdGtfZGVmYXVsdF9yZWdpc3Rlcl9iYXNlX25h
bWVz4oCZIGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCiA4
MyB8IHN0YXRpYyBjb25zdCBjaGFyIGNvbnN0IG10a19kZWZhdWx0X3JlZ2lzdGVyX2Jhc2VfbmFt
ZXNbXSA9IHsKIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgogSW4gZmlsZSBpbmNs
dWRlZCBmcm9tIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW1vb3JlLmg6MjUsCiBm
cm9tIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW1vb3JlLmM6MTI6CiBkcml2ZXJz
L3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29tbW9uLXYyLmg6ODM6Mjc6IHdhcm5pbmc6
IOKAmG10a19kZWZhdWx0X3JlZ2lzdGVyX2Jhc2VfbmFtZXPigJkgZGVmaW5lZCBidXQgbm90IHVz
ZWQgWy1XdW51c2VkLWNvbnN0LXZhcmlhYmxlPV0KIDgzIHwgc3RhdGljIGNvbnN0IGNoYXIgY29u
c3QgbXRrX2RlZmF1bHRfcmVnaXN0ZXJfYmFzZV9uYW1lc1tdID0gewogfCBefn5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+CiBJbiBmaWxlIGluY2x1ZGVkIGZyb20gZHJpdmVycy9waW5jdHJs
L21lZGlhdGVrL3BpbmN0cmwtcGFyaXMuaDoyNywKIGZyb20gZHJpdmVycy9waW5jdHJsL21lZGlh
dGVrL3BpbmN0cmwtcGFyaXMuYzoxNToKIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJs
LW10ay1jb21tb24tdjIuaDo4MzoyNzogd2FybmluZzog4oCYbXRrX2RlZmF1bHRfcmVnaXN0ZXJf
YmFzZV9uYW1lc+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3QtdmFyaWFi
bGU9XQogODMgfCBzdGF0aWMgY29uc3QgY2hhciBjb25zdCBtdGtfZGVmYXVsdF9yZWdpc3Rlcl9i
YXNlX25hbWVzW10gPSB7CiB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4KIEluIGZp
bGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1wYXJpcy5o
OjI3LAogZnJvbSBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstbXQ2Nzk3Lmg6
MTUsCiBmcm9tIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10Njc5Ny5jOjEzOgog
ZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12Mi5oOjgzOjI3OiB3
YXJuaW5nOiDigJhtdGtfZGVmYXVsdF9yZWdpc3Rlcl9iYXNlX25hbWVz4oCZIGRlZmluZWQgYnV0
IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCiA4MyB8IHN0YXRpYyBjb25zdCBj
aGFyIGNvbnN0IG10a19kZWZhdWx0X3JlZ2lzdGVyX2Jhc2VfbmFtZXNbXSA9IHsKIHwgXn5+fn5+
fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgogSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGRyaXZlcnMv
cGluY3RybC9tZWRpYXRlay9waW5jdHJsLXBhcmlzLmg6MjcsCiBmcm9tIGRyaXZlcnMvcGluY3Ry
bC9tZWRpYXRlay9waW5jdHJsLW10ay1tdDgxODMuaDoxMiwKIGZyb20gZHJpdmVycy9waW5jdHJs
L21lZGlhdGVrL3BpbmN0cmwtbXQ4MTgzLmM6OToKIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9w
aW5jdHJsLW10ay1jb21tb24tdjIuaDo4MzoyNzogd2FybmluZzog4oCYbXRrX2RlZmF1bHRfcmVn
aXN0ZXJfYmFzZV9uYW1lc+KAmSBkZWZpbmVkIGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtY29uc3Qt
dmFyaWFibGU9XQogODMgfCBzdGF0aWMgY29uc3QgY2hhciBjb25zdCBtdGtfZGVmYXVsdF9yZWdp
c3Rlcl9iYXNlX25hbWVzW10gPSB7CiB8IF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4K
IEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1w
YXJpcy5oOjI3LAogZnJvbSBkcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstbXQ2
NzY1Lmg6MTIsCiBmcm9tIGRyaXZlcnMvcGluY3RybC9tZWRpYXRlay9waW5jdHJsLW10Njc2NS5j
OjEwOgogZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1vbi12Mi5oOjgz
OjI3OiB3YXJuaW5nOiDigJhtdGtfZGVmYXVsdF9yZWdpc3Rlcl9iYXNlX25hbWVz4oCZIGRlZmlu
ZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dCiA4MyB8IHN0YXRpYyBj
b25zdCBjaGFyIGNvbnN0IG10a19kZWZhdWx0X3JlZ2lzdGVyX2Jhc2VfbmFtZXNbXSA9IHsKIHwg
Xn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fgoKQ2M6IFNlYW4gV2FuZyA8c2Vhbi53YW5n
QGtlcm5lbC5vcmc+CkNjOiBNYXR0aGlhcyBCcnVnZ2VyIDxtYXR0aGlhcy5iZ2dAZ21haWwuY29t
PgpDYzogbGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpTaWduZWQtb2ZmLWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgotLS0KIGRyaXZlcnMvcGluY3RybC9tZWRp
YXRlay9waW5jdHJsLW10ay1jb21tb24tdjIuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGlu
c2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGluY3RybC9t
ZWRpYXRlay9waW5jdHJsLW10ay1jb21tb24tdjIuaCBiL2RyaXZlcnMvcGluY3RybC9tZWRpYXRl
ay9waW5jdHJsLW10ay1jb21tb24tdjIuaAppbmRleCAyN2RmMDg3MzYzOTYwLi40NWFhMGZkYmUz
MzA2IDEwMDY0NAotLS0gYS9kcml2ZXJzL3BpbmN0cmwvbWVkaWF0ZWsvcGluY3RybC1tdGstY29t
bW9uLXYyLmgKKysrIGIvZHJpdmVycy9waW5jdHJsL21lZGlhdGVrL3BpbmN0cmwtbXRrLWNvbW1v
bi12Mi5oCkBAIC04MCw3ICs4MCw3IEBAIGVudW0gewogCURSVl9HUlBfTUFYLAogfTsKIAotc3Rh
dGljIGNvbnN0IGNoYXIgKiBjb25zdCBtdGtfZGVmYXVsdF9yZWdpc3Rlcl9iYXNlX25hbWVzW10g
PSB7CitzdGF0aWMgY29uc3QgY2hhciAqIGNvbnN0IG10a19kZWZhdWx0X3JlZ2lzdGVyX2Jhc2Vf
bmFtZXNbXSBfX21heWJlX3VudXNlZCA9IHsKIAkiYmFzZSIsCiB9OwogCi0tIAoyLjI1LjEKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRp
YXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
