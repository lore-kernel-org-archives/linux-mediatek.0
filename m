Return-Path: <SRS0=pLce=IU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38193C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 15:09:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B97E26198D
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Mar 2021 15:09:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B97E26198D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=0fP8hhKuqqirw0rM0RkNwxLnUzgnHL3LZk8Go+f+1Rg=; b=a32qhD5R6WLBfjhwvOG/S1CTe
	tjZ9blhenuByEco3qobN2+rUB/frEC8vNnCauXQVo7fNLgZ673TcNxPbQ0GQDk1guKZiltDXXd1LI
	n7x6SdtkNZkDVkBBtCbQFO59yIw7QgMT0nGic7Fkx5ZzGpz79bJoi6UnnCKnF8Ca23O7YjAWkLLYn
	80VtL6+GL3TqBwMDHHveiDCgunQlbw2EyyQocE66FLlp63tACIZ3nGSW5ngz18f8HFepRVLT+4aE2
	mDoN1nzFgvq59WM3e/l3Ip/TabZjH2T5ajJkkqx1cZyZW7vuCUx++bGUcQtiOr6pOaU/kyMNpf2sz
	e83CYCEgw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOMBD-00BrHr-Cx; Mon, 22 Mar 2021 15:09:19 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOMAu-00BrDu-JT; Mon, 22 Mar 2021 15:09:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B1E946198B;
 Mon, 22 Mar 2021 15:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616425739;
 bh=3PQXyCv/6RPiauJW0RbXVxOk51+3YNHHQ4q0ubjIYI0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kUnTB41nwt/2gBmhP5ra1WG35j5VTc2LbveK7j4gYYhiDA0OqxLIqzjvVOabd+9hc
 8c5/bpXntK3H7xflMSt0Th2yx9BsVEqcuI9NF4Wn6e2wP5JfgMsrPZwU+jheE+oB+K
 j/tjJr0G/YIBU/+PDC1QZVKxhpIwvNjiOY8bK+KxxcWMUKlT+SdzDnUQ8hd3QqNqt9
 z+A5Ua1kThRlsTSklCyjRjlnm4zUcqkOyECsZ0CH03GglurtOgWsP56zLSaDtfWusJ
 DoQJodK5+AjShphBYD2Pui6068ctfFfdvKYk8QbT0YAEO3PS7bcOODP+Cr1Y2UQWv4
 A2QW0y6P5PFWg==
Received: by mail-ej1-f44.google.com with SMTP id u5so21865048ejn.8;
 Mon, 22 Mar 2021 08:08:58 -0700 (PDT)
X-Gm-Message-State: AOAM530v7NYYfATT1qr0fP2FiF4pAGKSkPFXYpFtWIYoHXCFkVjk8OyC
 nybCz3/qPFalFtimMZXRMLXgqG9rxoS+XsD2KA==
X-Google-Smtp-Source: ABdhPJy9CuEFTxVWjGKeDPfSnb0lRo8CbqOcKlR4LhHv/z1CX1/0nQw1fX42KGso9lasF9MhwTQPQqeELQ+Ao8npxVA=
X-Received: by 2002:a17:906:9888:: with SMTP id
 zc8mr242694ejb.310.1616425737261; 
 Mon, 22 Mar 2021 08:08:57 -0700 (PDT)
MIME-Version: 1.0
References: <1609815993-22744-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609815993-22744-9-git-send-email-yongqiang.niu@mediatek.com>
In-Reply-To: <1609815993-22744-9-git-send-email-yongqiang.niu@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 22 Mar 2021 23:08:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY__HO1AJ2xjRu7B+0Xs9MRHiifQYGNz5vr-EsVkQ7NeZBA@mail.gmail.com>
Message-ID: <CAAOTY__HO1AJ2xjRu7B+0Xs9MRHiifQYGNz5vr-EsVkQ7NeZBA@mail.gmail.com>
Subject: Re: [PATCH v4, 08/10] soc: mediatek: mmsys: add component RDMA4
To: Yongqiang Niu <yongqiang.niu@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Mark Rutland <mark.rutland@arm.com>, DTML <devicetree@vger.kernel.org>, 
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_150901_952395_5B0E2592 
X-CRM114-Status: GOOD (  15.39  )
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

SGksIE1hdHRoaWFzOgoKWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+
IOaWvCAyMDIx5bm0MeaciDXml6Ug6YCx5LqMIOS4iuWNiDExOjA35a+r6YGT77yaCj4KPiBUaGlz
IHBhdGNoIGFkZCBjb21wb25lbnQgUkRNQTQKPgo+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBO
aXUgPHlvbmdxaWFuZy5uaXVAbWVkaWF0ZWsuY29tPgo+IFJldmlld2VkLWJ5OiBDaHVuLUt1YW5n
IEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCkhvdyBkbyB5b3UgdGhpbmsgYWJvdXQgdGhp
cyBwYXRjaD8gT25lIGRybSBwYXRjaCBbMV0gZGVwZW5kcyBvbiB0aGlzIHBhdGNoLgoKWzFdIGh0
dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9saW51eC1tZWRpYXRlay9wYXRjaC8y
MDIxMDIwMjA4MTIzNy43NzQ0NDItNC1oc2lueWlAY2hyb21pdW0ub3JnLwoKUmVnYXJkcywKQ2h1
bi1LdWFuZy4KCj4gLS0tCj4gIGluY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5o
IHwgMSArCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+Cj4gZGlmZiAtLWdpdCBh
L2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oIGIvaW5jbHVkZS9saW51eC9z
b2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgKPiBpbmRleCAxMzU0NmU5Li4yYzExNjE3IDEwMDY0NAo+
IC0tLSBhL2luY2x1ZGUvbGludXgvc29jL21lZGlhdGVrL210ay1tbXN5cy5oCj4gKysrIGIvaW5j
bHVkZS9saW51eC9zb2MvbWVkaWF0ZWsvbXRrLW1tc3lzLmgKPiBAQCAtMzgsNiArMzgsNyBAQCBl
bnVtIG10a19kZHBfY29tcF9pZCB7Cj4gICAgICAgICBERFBfQ09NUE9ORU5UX1JETUEwLAo+ICAg
ICAgICAgRERQX0NPTVBPTkVOVF9SRE1BMSwKPiAgICAgICAgIEREUF9DT01QT05FTlRfUkRNQTIs
Cj4gKyAgICAgICBERFBfQ09NUE9ORU5UX1JETUE0LAo+ICAgICAgICAgRERQX0NPTVBPTkVOVF9V
Rk9FLAo+ICAgICAgICAgRERQX0NPTVBPTkVOVF9XRE1BMCwKPiAgICAgICAgIEREUF9DT01QT05F
TlRfV0RNQTEsCj4gLS0KPiAxLjguMS4xLmRpcnR5Cj4gX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKPiBM
aW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCj4gaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
