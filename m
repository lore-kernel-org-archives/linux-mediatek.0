Return-Path: <SRS0=02OB=GO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA30BC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 23:30:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FF6F22D0B
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Jan 2021 23:30:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4FF6F22D0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TVhxfyC0cwBhcWFmyh/WSGUALahTKMQ197Y+W8E8qCg=; b=cZ/HfRtxE+7vREKPW07aXyjgb
	LESR4hvk1aAST0Tt9byFf2WSt9xqZ7FI5wdwMYAk5AIXWtIacsBm0MVDLMtkI6Qdx27NoF/9XXpHq
	a4sKXhQclmURSPCveLoOultyiNI28Yk9tZ2JHetRjihAZ+7lOyc+uAUukY4bj4JzBQRyfWNpCalYR
	CSC3lxLuSXdf4s0NkwUPNCKXyl7PaCkF2T4ZlyfGdwCL7/3zallCLQXEx8wac+Qk5W1a37B0Yu9io
	x9Xz153KGKgJqXilpX++5Zmbebv70snCQR+wpwUAuWfIVvHgvU3yCkn3G45QvdAkQUtjdzqmqERCU
	S9odjG7pw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kz6e5-0006KK-Hz; Mon, 11 Jan 2021 23:30:45 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kz6ds-0006Db-7w; Mon, 11 Jan 2021 23:30:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E43922D6D;
 Mon, 11 Jan 2021 23:30:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610407829;
 bh=wY6WyJnyn9l1uwrWbWHDhefPmOISumjIE80nS7nbeWw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Y8T4muPUcBgbTVPe7FTnsA5LKfJuPHHRfgndFWSilgpS0ZTgL/ptC/wZULassWj6C
 4j8UKWV2fGSGgERGw9SoY1PeqwbalopJtlD9dPVfdiASi0c20eHH0o/GEc4oPKIBSP
 JDjPEN6T3MhIMKlxeJiaa+1QuaE09Vs/01xG4u7gz+PWESD9aclM+MqTuLGm22tbkO
 AesCFZj8KgUyL040eHfiXr2KHrhFYXTUAVv69fe9uQtS8pgwl03f3Tl71em2RdpFqf
 TwGMv2zOFfqpAyyu1tGdiWoxYpJ/b949IU6vwY7SPoEKYBVMHDNCkE0hJ4KqskE8WD
 mBArExwmnNqcw==
Received: by mail-ed1-f47.google.com with SMTP id h16so278355edt.7;
 Mon, 11 Jan 2021 15:30:28 -0800 (PST)
X-Gm-Message-State: AOAM532RmRZzNDmZH26q0vnzj7X1QJ0bXb85cZVMfnJsYQVhjrTpVOMS
 AQkB3PLJUfl69N5ftz1JVpp1MWgCeDH7FMZZjA==
X-Google-Smtp-Source: ABdhPJw/nqrPwedUsYYELvqmQQV2DVc/qTFoJ6TexxxOKDBI8IG/Cky1sIApLzU+/jMMXRGHkDWXdP+ADAPgZ8NARYQ=
X-Received: by 2002:a50:fc96:: with SMTP id f22mr1283182edq.162.1610407827487; 
 Mon, 11 Jan 2021 15:30:27 -0800 (PST)
MIME-Version: 1.0
References: <1610351031-21133-1-git-send-email-yongqiang.niu@mediatek.com>
 <1610351031-21133-2-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1610351031-21133-2-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 12 Jan 2021 07:30:16 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8aUJQJimDk8gy-Jc8JXtdOmvm_+2eKnYp1p_CDbF_=dQ@mail.gmail.com>
Message-ID: <CAAOTY_8aUJQJimDk8gy-Jc8JXtdOmvm_+2eKnYp1p_CDbF_=dQ@mail.gmail.com>
Subject: Re: [PATCH v3,
 01/15] dt-bindings: mediatek: add description for postmask
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210111_183032_446273_4D6A6996 
X-CRM114-Status: GOOD (  15.99  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Hsin-Yi Wang <hsinyi@chromium.org>,
 CK Hu <ck.hu@mediatek.com>, Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

WW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+IOaWvCAyMDIx5bm0Meac
iDEx5pelIOmAseS4gCDkuIvljYgzOjQ05a+r6YGT77yaCj4KPiBhZGQgZGVzY3JpcHRpb24gZm9y
IHBvc3RtYXNrCj4gcG9zdG1hc2sgaXMgdXNlZCBjb250cm9sIHJvdW5kIGNvcm5lciBmb3IgZGlz
cGxheSBmcmFtZQoKQWZ0ZXIgY2hhbmdpbmcgdG8gJ3VzZWQgdG8gY29udHJvbCcsCgpSZXZpZXdl
ZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4gU2lnbmVk
LW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+Cj4gLS0t
Cj4gIERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21l
ZGlhdGVrLGRpc3AudHh0IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+
Cj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5
L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQKPiBpbmRleCBjNTYyY2Rh
Li45ZDlhYjY1IDEwMDY0NAo+IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0Cj4gKysrIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlzcC50eHQK
PiBAQCAtMzcsNiArMzcsNyBAQCBSZXF1aXJlZCBwcm9wZXJ0aWVzIChhbGwgZnVuY3Rpb24gYmxv
Y2tzKToKPiAgICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZGlzcC1hYWwiICAgICAgICAgICAgICAt
IGFkYXB0aXZlIGFtYmllbnQgbGlnaHQgY29udHJvbGxlcgo+ICAgICAgICAgIm1lZGlhdGVrLDxj
aGlwPi1kaXNwLWdhbW1hIiAgICAgICAgICAgIC0gZ2FtbWEgY29ycmVjdGlvbgo+ICAgICAgICAg
Im1lZGlhdGVrLDxjaGlwPi1kaXNwLW1lcmdlIiAgICAgICAgICAgIC0gbWVyZ2Ugc3RyZWFtcyBm
cm9tIHR3byBSRE1BIHNvdXJjZXMKPiArICAgICAgICJtZWRpYXRlayw8Y2hpcD4tZGlzcC1wb3N0
bWFzayIgICAgICAgICAtIGNvbnRyb2wgcm91bmQgY29ybmVyIGZvciBkaXNwbGF5IGZyYW1lCj4g
ICAgICAgICAibWVkaWF0ZWssPGNoaXA+LWRpc3Atc3BsaXQiICAgICAgICAgICAgLSBzcGxpdCBz
dHJlYW0gdG8gdHdvIGVuY29kZXJzCj4gICAgICAgICAibWVkaWF0ZWssPGNoaXA+LWRpc3AtdWZv
ZSIgICAgICAgICAgICAgLSBkYXRhIGNvbXByZXNzaW9uIGVuZ2luZQo+ICAgICAgICAgIm1lZGlh
dGVrLDxjaGlwPi1kc2kiICAgICAgICAgICAgICAgICAgIC0gRFNJIGNvbnRyb2xsZXIsIHNlZSBt
ZWRpYXRlayxkc2kudHh0Cj4gLS0KPiAxLjguMS4xLmRpcnR5Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxp
c3QKPiBMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGlu
ZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
