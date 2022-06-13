Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51840C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 20:10:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y20AWzTFCMeJVT09lPSA74iffVIT1XOgGcep3v17WYg=; b=Ickt+nOvFX7D3i
	nsAXrToyk0YgdAi9cdEuakRnwbEHy1TVKLEWf+qV79+qxY7PlakIq5L0lpoxT+xmUpG6zXAiKON/f
	0CmdxykFHyl9sNfYPMxp6ciaOwkzbuw4fAlKZdJXfogzOh4Nv7iDlfgcbRgP30e1fCNaMjGuXooFV
	t3yFGw6zeqdF2LYjQ4bwQQAT8Nq8yFbSsz3C4lfsT4SyoYpDKPqJL2ena/yk+ml9LOks7btUj9mgz
	uNmeaNoILBmQz4bcxcCw+o0YTKfi5GlpgXcdhfGE7p9qeH/THlblfO+29L981NCqZX/i62g7d51kC
	6U4I/xlfz849jXvVv5gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0qOK-005WV6-Hz; Mon, 13 Jun 2022 20:10:28 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0qO4-005WL9-7I
	for linux-mediatek@lists.infradead.org; Mon, 13 Jun 2022 20:10:14 +0000
Received: by mail-qk1-x736.google.com with SMTP id n197so4908427qke.1
        for <linux-mediatek@lists.infradead.org>; Mon, 13 Jun 2022 13:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=v7I9W+KWz8qCcwRO9hK+FauPyteN/yVzDhLqH8wmqRU=;
        b=qUfbsn7KlSJMoOLXI6w6yy7TrJ1t3GV0eaUVEpVlSmhhSGPrIysNUeydu8ibydKY2p
         1zMc9WXdAnvTmzm/lrM27CFeS6jhwcwhiZx2Ch+XXMkguFXByWQ1/3m9I+9pp8etU2CF
         wrkQRVC0U5MG0ta45bpCFNsfYcLbmavJSAPP3NEu/pDmPwFapsEotpifbzYcKQ5wkiL4
         dAYl9wue9Te1yAbLZJE0fxDNbbZKuu1H0mwbDD3ztzuhlxwL2jF0RXF9WlqjiHKqlmm8
         +eZ7tSpup8IssWLJOtSXTNAsUlDpf5nuAlDTqiciGANTlc+VgbcwYDZbXTeCqb3jVEOo
         vXRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=v7I9W+KWz8qCcwRO9hK+FauPyteN/yVzDhLqH8wmqRU=;
        b=j5W6WhHGN81EZKB7Vv8eJ+W7dBFBMoqGZVqtdBEgP9FLIuFTDyNEN2TzmGF2YdhKj9
         iA5YQkRGTVdowv9czOT/Z2Z5SFc1HJ8is2fUQHFfjR1xJnp6P/iyg9li75+u5v221oUT
         rln1HNQQk/tFDZxUiwGiLuDcjsvU+198go7S70qTZmFTqA+kORuMf5Ce1DowqHcLu9Wt
         YdeDrQEs1ScSeBkcAJeL3hncFGILU0hGOFpTGRLAvoUU60Pvd6WTBjGQBjDwvv+hXOs9
         lved+OzJQv54JfNfhkD+l7h5cLCIlMS0fQWnc/PYxbY8QnLsSqHOwqJOiyVYT/Z+xo0U
         vfMQ==
X-Gm-Message-State: AOAM532ssGD7+KB+pe/ddCMAQToJsKid3SbK1BjXBC2yiaTQnqYCKuaU
	yk+ClfoXzUx6reLhF/bZ0fCRIg==
X-Google-Smtp-Source: ABdhPJypEb0jxGKtk5VfHQekdsoaNysCZ3OatxB9gwkAI+QgXupZeQPtmwZAmNKNz+Dgb1z5OMMIwQ==
X-Received: by 2002:a05:620a:4e9:b0:6a7:8357:303d with SMTP id b9-20020a05620a04e900b006a78357303dmr1407957qkh.105.1655151007308;
        Mon, 13 Jun 2022 13:10:07 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (192-222-136-102.qc.cable.ebox.net. [192.222.136.102])
        by smtp.gmail.com with ESMTPSA id r13-20020a05620a298d00b006a6d60a39d0sm8268202qkp.5.2022.06.13.13.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jun 2022 13:10:06 -0700 (PDT)
Message-ID: <edbb4605c9e30329d2f5a4ff738571acb6b91f1f.camel@ndufresne.ca>
Subject: Re: [PATCH v4, 0/3] add h264 decoder driver for mt8186
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Yunfei Dong <yunfei.dong@mediatek.com>, Alexandre Courbot
 <acourbot@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>, Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Tomasz
 Figa <tfiga@google.com>
Cc: George Sun <george.sun@mediatek.com>, Xiaoyong Lu
 <xiaoyong.lu@mediatek.com>,  Hsin-Yi Wang <hsinyi@chromium.org>, Fritz
 Koenig <frkoenig@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,  dri-devel
 <dri-devel@lists.freedesktop.org>, Irui Wang <irui.wang@mediatek.com>,
 Steve Cho <stevecho@chromium.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Mon, 13 Jun 2022 16:10:05 -0400
In-Reply-To: <20220512034620.30500-1-yunfei.dong@mediatek.com>
References: <20220512034620.30500-1-yunfei.dong@mediatek.com>
User-Agent: Evolution 3.44.1 (3.44.1-1.fc36) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_131012_356960_BA5D0A09 
X-CRM114-Status: GOOD (  16.06  )
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

TGUgamV1ZGkgMTIgbWFpIDIwMjIgw6AgMTE6NDYgKzA4MDAsIFl1bmZlaSBEb25nIGEgw6ljcml0
wqA6Cj4gRmlyc3RseSwgYWRkIG10ODE4NiBjb21wYXRpYmxlIGFuZCBwcml2YXRlIGRhdGEsIHRo
ZW4gYWRkIGRvY3VtZW50IGZvcgo+IGNvbXBhdGlibGUgIm1lZGlhdGVrLG10ODE4Ni12Y29kZWMt
ZGVjIi4gRm9yIG10ODE4NiBpcyBzaW5nbGUgY29yZQo+IGFyY2hpdGVjdHVyZSwgbmVlZCB0byBh
ZGQgbmV3IGludGVyZmFjZSBmb3IgaDI2NCBoYXJkd2FyZSBkZWNvZGVyLgoKV291bGQgYmUgbmlj
ZSB0byB0YWtlIHRoZSBoYWJpdCBvZiBzaGFyaW5nIGZsdXN0ZXIgc2NvcmUgZm9yIHRoaXMgbmV3
IEhXLCBJCndvdWxkIGV4cGVjdCBubyBsZXNzIHRoZW4gd2hhdCB0aGUgbnVtYmVycyB5b3UnZCBn
ZXQgZnJvbSBydW5uaW5nIG92ZXIgTVQ4MTk1IG9yCjkyLCByZW1haW5zIG5pY2UgdG8gZGVtb25z
dHJhdGUgdGhhdCB0aGlzIHdhcyB0ZXN0ZWQgYW5kIGRvY3VtZW50IGFueSBvb3BzIGFsb25nCnRo
ZSB3YXkuCj4gCj4gUGF0Y2hlIDEgYWRkIG10ODE4NiBjb21wYXRpYmxlIGFuZCBwcml2YXRlIGRh
dGEuCj4gUGF0Y2hlIDIgYWRkIG10ODE4NiBjb21wYXRpYmxlIGRvY3VtZW50Lgo+IFBhdGNoZSAz
IGFkZCBoMjY0IHNpbmdsZSBjb3JlIGRyaXZlci4KPiAtLS0KPiBUaGlzIHBhdGNoIGRlcGVuZHMg
b24gInN1cHBvcnQgZm9yIE1UODE5MiBkZWNvZGVyIlsxXQo+IAo+IFsxXSAgaHR0cHM6Ly9wYXRj
aHdvcmsua2VybmVsLm9yZy9wcm9qZWN0L2xpbnV4LW1lZGlhdGVrL2NvdmVyLzIwMjIwNTEyMDIx
OTUwLjI5MDg3LTEteXVuZmVpLmRvbmdAbWVkaWF0ZWsuY29tLwo+IC0tLQo+IGNoYW5nZWQgd2l0
aCB2MzoKPiAtIGZpeCBfX2lvbWVtIG5vdCByZWFzb25hYmxlLCBhbGlnbiBzaGFyZSBtZW1vcnkg
dG8gZHJhbS4KPiBjaGFuZ2VkIHdpdGggdjI6Cj4gLSBmaXggc3BhcnNlIGFuZCBzbWF0Y2ggY2hl
Y2sgZmFpbCBmb3IgcGF0Y2ggMwo+IGNoYW5nZWQgd2l0aCB2MToKPiAtIHJlYmFzZSBkcml2ZXIg
dG8gdGhlIGxhdGVzdCBtZWRpYV9zdGFnZS4KPiAtLS0KPiBZdW5mZWkgRG9uZyAoMyk6Cj4gICBk
dC1iaW5kaW5nczogbWVkaWE6IG1lZGlhdGVrOiB2Y29kZWM6IEFkZHMgZGVjb2RlciBkdC1iaW5k
aW5ncyBmb3IKPiAgICAgbXQ4MTg2Cj4gICBtZWRpYTogbWVkaWF0ZWs6IHZjb2RlYzogU3VwcG9y
dCBNVDgxODYKPiAgIG1lZGlhOiBtZWRpYXRlazogdmNvZGVjOiBhZGQgaDI2NCBkZWNvZGVyIGRy
aXZlciBmb3IgbXQ4MTg2Cj4gCj4gIC4uLi9tZWRpYS9tZWRpYXRlayx2Y29kZWMtc3ViZGV2LWRl
Y29kZXIueWFtbCB8ICAgNCArLQo+ICAuLi4vcGxhdGZvcm0vbWVkaWF0ZWsvdmNvZGVjL210a192
Y29kZWNfZGVjLmggfCAgIDEgKwo+ICAuLi4vbWVkaWF0ZWsvdmNvZGVjL210a192Y29kZWNfZGVj
X2Rydi5jICAgICAgfCAgIDQgKwo+ICAuLi4vdmNvZGVjL210a192Y29kZWNfZGVjX3N0YXRlbGVz
cy5jICAgICAgICAgfCAgMTkgKysKPiAgLi4uL3Zjb2RlYy92ZGVjL3ZkZWNfaDI2NF9yZXFfbXVs
dGlfaWYuYyAgICAgIHwgMTc3ICsrKysrKysrKysrKysrKysrLQo+ICA1IGZpbGVzIGNoYW5nZWQs
IDIwMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlz
dApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
