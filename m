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
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC642C433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 04:05:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5547961104
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 04:05:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5547961104
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6YS2B/yCs7L1MQXpVWG75W5+ajpj49bEwb7wWUyWuwk=; b=Svkl6lJljOVz6XV3WWn4EmLuZ
	eMAG0+St1/CBN78CX9ky+OwfHo/291WXWCuvbTxbo9ACcKtASc9jtfwnN4pcrJy+XiG7qW4WPq4yI
	e5VjZnTCnau2SRkku3rjtcFp6/2uTbKGSMOljvcJ6/iKKg8+3k9BKmgE/yRsEjAWwbwcIhkql1ToK
	IY++35F0hzBFJN23/SQifvSRq9KCpnuR3t6bKtTb9ME/YW9xG1yIISo4wMDc4L6giN1jrm6s16MWC
	czPHvT5Z1gqppY5DTEB/jP6GSBKT1dIFaHK44bPW0kSj/cMEdOeSpM8F2OlDNRJV+R2yoshmiJcqq
	vTAg0w45w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYL9S-00924r-UE; Mon, 19 Apr 2021 04:04:47 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYL8x-00921D-Tb; Mon, 19 Apr 2021 04:04:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=nooF0bh3uQe/ilf/ttra6OUts5vU91KPBygIK+rN8CU=; b=Rs07f4amdW34dT8Zxmhebb87w/
 ZfOLpVeSDcy2wib2S/kCHkCleqcWAHg1K+XN/qcfsoZrox7b/QqdD2HblNUBPxrnPWD92dfWhNnPh
 4pc27XzLAkHrAWKa0wE+1Eeq9qurDs1npE8p6/6m8LiFA2lq8zUYB46C+kHXir/06jFEPiw2F4tJo
 Kpq2b7eXSgLS3yyRQLPkDY5PYQNICh6rhuTUjhfIj3djGoMqZEn7oJx8RU538CXM8TehRXlo+qpiW
 puq5KnTqpJSrIV8iJP0cXv6/MzLsxP9dEXDB9fmFniup/iDytZ9pV2VSJI611arNsrSpJ/cvMEhob
 nhjGr4Bw==;
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYL8s-00AwyY-CH; Mon, 19 Apr 2021 04:04:14 +0000
Received: by mail-pf1-x434.google.com with SMTP id w6so7760990pfc.8;
 Sun, 18 Apr 2021 21:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nooF0bh3uQe/ilf/ttra6OUts5vU91KPBygIK+rN8CU=;
 b=lAE1M2kH8mYGvH4QI2ZOpm39wWa82gcbp2UhP0pd8YfHtS/cOHPn9k/+8vBbmYjPJQ
 B7YLOHcKKQodQni2ID6ZRG2C0cTCaYNx0r8PsACXLeUGRwGlqUl6sFPiguWqasIDKqv7
 9sQbY2hmfpnYLHWq9rpDcQ8NcaTO9VZfmP6dzOiwAOykn5lV7XDx4ktxT1rTQzVPy/K8
 EoGHHeIwtJ2vkaSTMK03l0Ffalq/2ItfJ/UjGYt33pY8UzUOtJc4ki8GM+TECddbVxH9
 gZBsQUe370IvM+hutvbSC+uZlHx4BTSlVKqXbdZ4kLdJaD68OVyJoBhG9DWErIBZWrLm
 Ucbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nooF0bh3uQe/ilf/ttra6OUts5vU91KPBygIK+rN8CU=;
 b=Xd77az0tUDVP5af6Sw9Z6QHzyoV3+YXxbWhaATJFUSYomnFvMa8aDGVcImOehQ1ern
 yjxCijdzH7pSlnNcsLJapkAJfE2VsiQx7MotQGunMEzZQiQ5r/sOlLjJiSZvzDlCBDgw
 rGf5kV+nSGRDD+mrKmuDmUa7UITky1B0jPCDf5LqLDl6F02szEvGOtn1hqsuk3WTRg5z
 otuCVtrnR0QNzQFF83GhyBtHiJUzb1Uw6L4oykHsyVuRRMSPtge2QbTUdtMwq6+n70P0
 5OWQW/Ubb/dqx7YbVlGMqSP/4gP1xNxunPI8QZjJCt1agiasuvQFhDU4Yvx2ivZefzL3
 Q9Mg==
X-Gm-Message-State: AOAM533nspRjlFVI+zaH2baKQUoYmGDYk3KC7LZiIsKf/nVo60O0Ogw5
 hIA1kgRlmjZjEqptT4Bra44=
X-Google-Smtp-Source: ABdhPJz2bKhFE3qPTDDPaQXc8tpwKJvnnZWr0+4qR2uTa5yoJE0Y33ONufXaKA1nPG7HARQ8c5C9Tw==
X-Received: by 2002:a63:5f54:: with SMTP id t81mr3727918pgb.286.1618805048816; 
 Sun, 18 Apr 2021 21:04:08 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id 25sm12169423pgx.72.2021.04.18.21.04.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 Apr 2021 21:04:08 -0700 (PDT)
From: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>,
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>,
 Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Cc: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 =?UTF-8?q?Ren=C3=A9=20van=20Dorst?= <opensource@vdorst.com>
Subject: [PATCH net-next 2/2] net: ethernet: mediatek: support custom GMAC
 label
Date: Sun, 18 Apr 2021 21:03:52 -0700
Message-Id: <20210419040352.2452-3-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419040352.2452-1-ilya.lipnitskiy@gmail.com>
References: <20210419040352.2452-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210418_210410_458588_4F2E440C 
X-CRM114-Status: GOOD (  14.26  )
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

VGhlIE1BQyBkZXZpY2UgbmFtZSBjYW4gbm93IGJlIHNldCB3aXRoaW4gRFRTIGZpbGUgaW5zdGVh
ZCBvZiBhbHdheXMKYmVpbmcgImV0aFgiLiBUaGlzIGlzIGhlbHBmdWwgZm9yIERTQSB0byBjbGVh
cmx5IGxhYmVsIHRoZSBEU0EgbWFzdGVyCmRldmljZSBhbmQgZGlzdGluZ3Vpc2ggaXQgZnJvbSBE
U0Egc2xhdmUgcG9ydHMuCgpGb3IgZXhhbXBsZSwgc29tZSBkZXZpY2VzLCBzdWNoIGFzIHRoZSBV
YmlxdWl0aSBFZGdlUm91dGVyIFgsIG1heSBoYXZlCnBvcnRzIGxhYmVsZWQgZXRoWC4gTGFiZWxp
bmcgdGhlIG1hc3RlciBHTUFDIHdpdGggYSBkaWZmZXJlbnQgcHJlZml4CnRoYW4gRFNBIHBvcnRz
IGhlbHBzIHdpdGggY2xhcml0eS4KClN1Z2dlc3RlZC1ieTogUmVuw6kgdmFuIERvcnN0IDxvcGVu
c291cmNlQHZkb3JzdC5jb20+ClNpZ25lZC1vZmYtYnk6IElseWEgTGlwbml0c2tpeSA8aWx5YS5s
aXBuaXRza2l5QGdtYWlsLmNvbT4KLS0tCiBkcml2ZXJzL25ldC9ldGhlcm5ldC9tZWRpYXRlay9t
dGtfZXRoX3NvYy5jIHwgNCArKysrCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX2V0aF9zb2MuYyBi
L2RyaXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210a19ldGhfc29jLmMKaW5kZXggNmIwMGMx
MmM2YzQzLi40YzBjZTRmYjc3MzUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbmV0L2V0aGVybmV0L21l
ZGlhdGVrL210a19ldGhfc29jLmMKKysrIGIvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0ZWsv
bXRrX2V0aF9zb2MuYwpAQCAtMjg0NSw2ICsyODQ1LDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBu
ZXRfZGV2aWNlX29wcyBtdGtfbmV0ZGV2X29wcyA9IHsKIAogc3RhdGljIGludCBtdGtfYWRkX21h
YyhzdHJ1Y3QgbXRrX2V0aCAqZXRoLCBzdHJ1Y3QgZGV2aWNlX25vZGUgKm5wKQogeworCWNvbnN0
IGNoYXIgKmxhYmVsID0gb2ZfZ2V0X3Byb3BlcnR5KG5wLCAibGFiZWwiLCBOVUxMKTsKIAljb25z
dCBfX2JlMzIgKl9pZCA9IG9mX2dldF9wcm9wZXJ0eShucCwgInJlZyIsIE5VTEwpOwogCXBoeV9p
bnRlcmZhY2VfdCBwaHlfbW9kZTsKIAlzdHJ1Y3QgcGh5bGluayAqcGh5bGluazsKQEAgLTI5NDAs
NiArMjk0MSw5IEBAIHN0YXRpYyBpbnQgbXRrX2FkZF9tYWMoc3RydWN0IG10a19ldGggKmV0aCwg
c3RydWN0IGRldmljZV9ub2RlICpucCkKIAllbHNlCiAJCWV0aC0+bmV0ZGV2W2lkXS0+bWF4X210
dSA9IE1US19NQVhfUlhfTEVOR1RIXzJLIC0gTVRLX1JYX0VUSF9ITEVOOwogCisJaWYgKGxhYmVs
KQorCQlzdHJzY3B5KGV0aC0+bmV0ZGV2W2lkXS0+bmFtZSwgbGFiZWwsIElGTkFNU0laKTsKKwog
CXJldHVybiAwOwogCiBmcmVlX25ldGRldjoKLS0gCjIuMzEuMQoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
