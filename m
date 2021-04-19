Return-Path: <SRS0=CMHm=JQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B1FC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 03:43:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A453761107
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 03:43:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A453761107
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LCfosVA3Yne/UmTanmFiM/d1aaO5er/awocpE3+RNpU=; b=QIEfxneYi9xMfII1ORIwevD+y9
	aUwQwszxq71+gP5QjV3cRK0bpqEAy4kY7ms63gTpHPegzQmfcfPwCjWzU977pspVZNdoiQAJBi9X7
	YrjnmoJa+ZTHqIcTut7awwepOXmQ/ybJ4wBo/IZ0Ig70+5eZbiR+VhkSGkOMVxxJTrg0zO9OUm9sU
	KnaY6Aa2llTr131wf/ZKbeA8bVpHGaRSbqJyM9R7/thYk20Fhus7bCg5koUW1p2vDWF4ZjFMA5UKG
	onsEUTC3jiTRhfEF3wyXFugwDdE1iX1Q5M1A8dMOt4JxcqGnFBTrgSJIWUr8QotPr8R7b9wbmxs5Z
	Kwl0zt6g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYKoc-0090qr-4J; Mon, 19 Apr 2021 03:43:14 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYKoS-0090qU-EM; Mon, 19 Apr 2021 03:43:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=FjmLOq8AscliWv+GjWQBYtgkGTnMApgANFmdxbvdJ2Q=; b=EOwX4EjrjCpQQvKe2HFsYuld9J
 AbdiOFfKXZ3mNXUWs6+H/sBNUS7f22xRAxZOtb5Aqa8/WGe242Kz7G8PeHXltoHW3y5TnQcHZkFzJ
 r5Q/2NgIqvhkai6nnJV2GSBZz9N3DKx36q7Uc4tQ03bCBzw+gdjlvK8xV9FU/+GK7z1LxuYGDhanc
 skCh3cPQCu4M7qNbHTeE6HcaL7QIuxj8fRqDX1XdSypc5cwV8YsW17yYycCad+Q9ZMcmS7ST1zseX
 Ftn12VO3V++EIOX9bNJl2AzTeeqcGYwserZLFmLHoaVL1K83XJ9gOtgaIOWEAQnu2bqNK5gO9WVMh
 LV0Jhgwg==;
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYKoM-00Aw12-SN; Mon, 19 Apr 2021 03:43:03 +0000
Received: by mail-pg1-x52a.google.com with SMTP id p12so23299390pgj.10;
 Sun, 18 Apr 2021 20:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FjmLOq8AscliWv+GjWQBYtgkGTnMApgANFmdxbvdJ2Q=;
 b=WbPn5dbLh4aFvVmT5ar1EU2Ik4b66KqeuOQsi+yxhJiYauhJZ8VGl79NcwLlm2NDiQ
 kQNrVyLAgO+U1VDGF1LaKeIPWAXfCcSrunA4AHxW/CMbv98j4Dma9W1w63F4SoTz7KX4
 NOSyJQxVFIADh85rlrWRwuK1R2GQnieSVYYwPsicjWpxIIP/dJ4X1p4hiZMBQvNIzjDh
 wyf/tj0eZggxroVzT+yjNG/yUfj+G2f7027fhR9Y9bfvdw2qHt+EiFHbia3GMI4zxARq
 wBhwoS7NG/lH8Hdnul/CUREzQ1+zKZwjuFmcao2IDLazNAlj8RECgmrdUKqORIwlZoa4
 ZtmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FjmLOq8AscliWv+GjWQBYtgkGTnMApgANFmdxbvdJ2Q=;
 b=oq/hHg7q1Sr5Li+NLQcxdUO1KojLKxUnrQjnYY22ZRYKxrqXh+UBgIXdLG4EJMIJOq
 19zs4uRt30D+6yQQBzkeH7F1kBiSwVODiuGkg3FhGL8HZ3oqohUKaa++kpDEngsIG1Nr
 hVfreA+7c9NpzkEYg1HLJi+/KAzFIufzMuOFG4dDeZmPOtrICPHkgTJQ0CzWKQBv9blK
 Yc4hZ2O/AQ6osPaCy5MlxWw6cDZc5ZydmmTwXSg9eL1mym4ZJKKt9wp0TcB5LbXo22K+
 ktSyurZtBmWvGhThypAkc+Sq50RwE1nz4i5E0QX5mxPf9gYgAmHZU/b6DOFaY18EukH+
 XMCQ==
X-Gm-Message-State: AOAM533TXv2n7Iwzc7aRGaSb+o3L4ZrqLKP6MlOvAU2kWI7dukBiFsJ3
 hL0FP95ukOJao4fnk7txDYU=
X-Google-Smtp-Source: ABdhPJyoeOP0a/t5AWeTecXUJVWmB3q/yKl6pz4SiOFjNc/pWuDErwkkhtu6tb0rZWDuVNO5McblIw==
X-Received: by 2002:a62:be16:0:b029:25a:e1b4:5deb with SMTP id
 l22-20020a62be160000b029025ae1b45debmr10911501pff.66.1618803775470; 
 Sun, 18 Apr 2021 20:42:55 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id g24sm12477681pgn.18.2021.04.18.20.42.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 20:42:55 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Greg Ungerer <gerg@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Sean Wang <sean.wang@kernel.org>,
 =?UTF-8?q?Bj=C3=B8rn=20Mork?= <bjorn@mork.no>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
Subject: [PATCH] dt-bindings: net: mediatek: support MT7621 SoC
Date: Sun, 18 Apr 2021 20:42:53 -0700
Message-Id: <20210419034253.21322-1-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_204258_941659_2446F154 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
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

QWRkIG1pc3NpbmcgYmluZGluZyBkb2N1bWVudGF0aW9uIGZvciBTb0Mgc3VwcG9ydCB0aGF0IGhh
cyBiZWVuIGluIHBsYWNlCnNpbmNlIHY1LjEKCkZpeGVzOiA4ODliY2JkZWVlNTcgKCJuZXQ6IGV0
aGVybmV0OiBtZWRpYXRlazogc3VwcG9ydCBNVDc2MjEgU29DIGV0aGVybmV0IGhhcmR3YXJlIikK
Q2M6IEJqw7hybiBNb3JrIDxiam9ybkBtb3JrLm5vPgpTaWduZWQtb2ZmLWJ5OiBJbHlhIExpcG5p
dHNraXkgPGlseWEubGlwbml0c2tpeUBnbWFpbC5jb20+Ci0tLQogRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL25ldC9tZWRpYXRlay1uZXQudHh0IHwgMSArCiAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbmV0L21lZGlhdGVrLW5ldC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvbmV0L21lZGlhdGVrLW5ldC50eHQKaW5kZXggNzJkMDNlMDdjZjdjLi45NTBlZjZh
ZjIwYjEgMTAwNjQ0Ci0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQv
bWVkaWF0ZWstbmV0LnR4dAorKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
bmV0L21lZGlhdGVrLW5ldC50eHQKQEAgLTEwLDYgKzEwLDcgQEAgUmVxdWlyZWQgcHJvcGVydGll
czoKIC0gY29tcGF0aWJsZTogU2hvdWxkIGJlCiAJCSJtZWRpYXRlayxtdDI3MDEtZXRoIjogZm9y
IE1UMjcwMSBTb0MKIAkJIm1lZGlhdGVrLG10NzYyMy1ldGgiLCAibWVkaWF0ZWssbXQyNzAxLWV0
aCI6IGZvciBNVDc2MjMgU29DCisJCSJtZWRpYXRlayxtdDc2MjEtZXRoIjogZm9yIE1UNzYyMSBT
b0MKIAkJIm1lZGlhdGVrLG10NzYyMi1ldGgiOiBmb3IgTVQ3NjIyIFNvQwogCQkibWVkaWF0ZWss
bXQ3NjI5LWV0aCI6IGZvciBNVDc2MjkgU29DCiAJCSJyYWxpbmsscnQ1MzUwLWV0aCI6IGZvciBS
YWxpbmsgUnQ1MzUwRiBhbmQgTVQ3NjI4Lzg4IFNvQwotLSAKMi4zMS4xCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
