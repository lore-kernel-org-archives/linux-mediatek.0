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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFBDC433B4
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 15:47:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0278610CC
	for <linux-mediatek@archiver.kernel.org>; Mon, 19 Apr 2021 15:47:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A0278610CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=z7p9MbIZRSOBxHplEnCNpNIutuA3YpW3+pNM4ccX4BE=; b=nOfZ0I7t0OKvp7Appq55qAXTv
	tInBFSKXST9m7N4uGdisBEuhTkGDhOG9AK2TQjoa7Y6tzpHFGXB054Oe89IaE3Nfmt4nJDF+nvxIj
	DeqjkJh7oofD21tpWfXfr/rzw5CLXSDykvRetqiiyjxH05OYZG7/deLbsg7vB8+to0Tzta+lNEr8I
	aZ9cr5xhqkNWLX2quQe4p3gAEOmJ9XPZykFAOz0JMDlbw1MDmTbc0rpMelQ9K53zKm3ias/lUjdHh
	Ly3jscq5rlqB+3kx67srk9iwD38d3ZFl811Ws4jNaJdhQFssKLEECV1YAEbi/GUW2zk6CNEY6UR3r
	M5tI/s9FA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYW7g-00ADHQ-Ro; Mon, 19 Apr 2021 15:47:41 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYW7F-00ADED-Av; Mon, 19 Apr 2021 15:47:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=5bzjff+su6HXIaTpyjBroSwlupbpwpZmI0kJmdwR1sA=; b=vCTN+zPWwZMuRi7PMuGN10Thxx
 yBUcQPqyPzjEJJfkNlTU+mb5rLhb6xwHz5VQ4x6LJxbA0XIzGMOR7w50QRsykmFnF7C8nlyEci2cN
 wTYFN0q6pomfYq8JUTdtd4NWanLFidK+2Zo7KPsdC1DAixX1ZDX2Lso23kVBV5+17TAki4ggtXoUx
 oENiFJlvO2x/Ga3KtnTLq9PKQF6XtO2i/e8TlulJBg7lpx/U4m0YS2usYBtfjzEeGWrA8q18HEmrb
 1cM5U2gTg+OaRcXeX+b64nrFOlJ/5Bk5pDZrBY4q8hNkLtW9JxSXudIr1pQwx+g9cI7YLgJmqzyui
 amwuNxnQ==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYW7A-00BUwo-2B; Mon, 19 Apr 2021 15:47:12 +0000
Received: by mail-pf1-x435.google.com with SMTP id c3so4653207pfo.3;
 Mon, 19 Apr 2021 08:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5bzjff+su6HXIaTpyjBroSwlupbpwpZmI0kJmdwR1sA=;
 b=B9MXwRU5X1n4ceTorijsBBZblGJ8kcjMP43LSuW2efFbARNz7+Zvc5/SDoJ5hYkUKk
 aruI5gIM/i/+tKcnmSNUbHsG2g78SBSuBs6lKM21q/r0eHxTL9ZjaGzWVDfiT5h+ipAF
 QJnDmdyQ6htpSA3O8f0eSD7iYufopn+KFNDIg2gvLQPDh4TMQP7rJUSaLJO5JoQFloEm
 Q0fh76kPDqV6Ad31pVKMMI5PpqI8e4JnyjcWPS7dBdJJD+b2GaohejF+/HJqlPS+M2wA
 7aozd+lOFtMVviIWSSiPGlxXG/qsD6rKkGyz77O5HOk03CFUhcxKjmspZZpfa0B3VcbX
 8Wbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5bzjff+su6HXIaTpyjBroSwlupbpwpZmI0kJmdwR1sA=;
 b=QpKslXOfxwp0IsIDOKmzFfctL9beCLKX2c2nBgygiAStxes2MAQLFHfZR++FYjOZIa
 jfV/DXj/6m6EKPN6pB6LqWsEgm+pq1dKQ6UPSPorvC2k+PhtU2u3tmfG6Y5affgNp6on
 LUQPBeG4uUdTpL2PpOCdl9oW/R3Y8FaWv3xntRmSAXJ0ePTXjpC1a1CkZ0fcEwgM7NoK
 CXKPbeE7EHYW32B8VdMIooHPEQ7L8T+0MYiUFIvSTwjxCUs4vzIvaUrVjrxRzekIEFqf
 LH2sd+eODkwhfH4QRAbqk6OOD+1a8IzEPVbQ/rn0UJZBhwqh+hC2i3O4/jgN74Br4fWx
 f6nw==
X-Gm-Message-State: AOAM530q/RKaHsvU2zS09GEMiRa0fd1ZFS2iP+lEXkV0yzn9RMhC+o62
 fTlV7tRZCA6lDxnt7ehlZ2Y=
X-Google-Smtp-Source: ABdhPJy9R/pUClK4i2RW8B6XQkBUuBDnjzRtHvwyP++1eSHFoDzj6/4ku6ALOfkrnznbdlMghY4OKQ==
X-Received: by 2002:a63:e405:: with SMTP id a5mr8785503pgi.89.1618847227364;
 Mon, 19 Apr 2021 08:47:07 -0700 (PDT)
Received: from z640-arch.lan ([2602:61:7344:f100::678])
 by smtp.gmail.com with ESMTPSA id u1sm15314139pjj.19.2021.04.19.08.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Apr 2021 08:47:07 -0700 (PDT)
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
Subject: [PATCH net-next v2 2/2] net: ethernet: mediatek: support custom GMAC
 label
Date: Mon, 19 Apr 2021 08:46:59 -0700
Message-Id: <20210419154659.44096-3-ilya.lipnitskiy@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210419154659.44096-1-ilya.lipnitskiy@gmail.com>
References: <20210419154659.44096-1-ilya.lipnitskiy@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210419_084708_125375_3609B5F0 
X-CRM114-Status: GOOD (  15.06  )
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
dGtfZXRoX3NvYy5jIHwgNiArKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvbWVkaWF0
ZWsvbXRrX2V0aF9zb2MuYyBiL2RyaXZlcnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210a19ldGhf
c29jLmMKaW5kZXggNmIwMGMxMmM2YzQzLi5kZjNjZGE2M2E4YzUgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvbmV0L2V0aGVybmV0L21lZGlhdGVrL210a19ldGhfc29jLmMKKysrIGIvZHJpdmVycy9uZXQv
ZXRoZXJuZXQvbWVkaWF0ZWsvbXRrX2V0aF9zb2MuYwpAQCAtMjg0NSw2ICsyODQ1LDcgQEAgc3Rh
dGljIGNvbnN0IHN0cnVjdCBuZXRfZGV2aWNlX29wcyBtdGtfbmV0ZGV2X29wcyA9IHsKIAogc3Rh
dGljIGludCBtdGtfYWRkX21hYyhzdHJ1Y3QgbXRrX2V0aCAqZXRoLCBzdHJ1Y3QgZGV2aWNlX25v
ZGUgKm5wKQogeworCWNvbnN0IGNoYXIgKmxhYmVsID0gb2ZfZ2V0X3Byb3BlcnR5KG5wLCAibGFi
ZWwiLCBOVUxMKTsKIAljb25zdCBfX2JlMzIgKl9pZCA9IG9mX2dldF9wcm9wZXJ0eShucCwgInJl
ZyIsIE5VTEwpOwogCXBoeV9pbnRlcmZhY2VfdCBwaHlfbW9kZTsKIAlzdHJ1Y3QgcGh5bGluayAq
cGh5bGluazsKQEAgLTI4NjcsOSArMjg2OCwxMCBAQCBzdGF0aWMgaW50IG10a19hZGRfbWFjKHN0
cnVjdCBtdGtfZXRoICpldGgsIHN0cnVjdCBkZXZpY2Vfbm9kZSAqbnApCiAJCXJldHVybiAtRUlO
VkFMOwogCX0KIAotCWV0aC0+bmV0ZGV2W2lkXSA9IGFsbG9jX2V0aGVyZGV2KHNpemVvZigqbWFj
KSk7CisJZXRoLT5uZXRkZXZbaWRdID0gYWxsb2NfbmV0ZGV2KHNpemVvZigqbWFjKSwgbGFiZWwg
PyBsYWJlbCA6ICJldGglZCIsCisJCQkJICAgICAgIE5FVF9OQU1FX1VOS05PV04sIGV0aGVyX3Nl
dHVwKTsKIAlpZiAoIWV0aC0+bmV0ZGV2W2lkXSkgewotCQlkZXZfZXJyKGV0aC0+ZGV2LCAiYWxs
b2NfZXRoZXJkZXYgZmFpbGVkXG4iKTsKKwkJZGV2X2VycihldGgtPmRldiwgImFsbG9jX25ldGRl
diBmYWlsZWRcbiIpOwogCQlyZXR1cm4gLUVOT01FTTsKIAl9CiAJbWFjID0gbmV0ZGV2X3ByaXYo
ZXRoLT5uZXRkZXZbaWRdKTsKLS0gCjIuMzEuMQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1t
ZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
