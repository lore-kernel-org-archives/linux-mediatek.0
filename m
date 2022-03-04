Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDBC4C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 23:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8favXVTcBtv24d7mVVzjfrSyx8RALW27knaGqfYCSLI=; b=HqRZGSVOelR6je
	5uo+V8xPfV03sm0GNRBuzgHwOTRjGFD42D5Kiso/GcevjwXyAGB2WjMqEmkqiGs7esWdoMHOeoa7U
	vtAj7cnaFiiiXbZK0mioQgRW0IhbuzU6gf+J5TavJ5r2rjA9Nvb8Ucs4z8VQIDqlVL4SFGaAFYYtJ
	StAae2T4CVPo6td7EfMkXJu+bvRiJVBjDAs2IxPBKjnpuAy/ymJK025yxbaJJLZcXd20OgYHE+G+N
	NX44LYbyX8FXScR5qctjQvz/JTFF0d4oTBgxFHKw5lqN24fSUDI1Be8i+/8sHJkAzWOOnordO/CFF
	GrZxj1J6UDFFyF2HkGFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQHc3-00CNR4-5I; Fri, 04 Mar 2022 23:45:31 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQHbq-00CNLc-2l; Fri, 04 Mar 2022 23:45:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B80CFB82C71;
 Fri,  4 Mar 2022 23:45:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61FAFC340F0;
 Fri,  4 Mar 2022 23:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646437515;
 bh=NeRBwotyA+2T4DJi4XwW8R9F5009UEd0x0u94q4HzSU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=F4kIJg1JBz7deNxMyZ/NWRHbYHAWiOoPzls/nqlVNxWR4XRC0AXHq9Bu8c/tdM0nt
 F/b68J2MS2rmnOFIhnh3J31DgEZgxe6h6VKEUKH1UDGlmAD+ruRiX51NkXcPnYxO53
 P38M7Rdo1D/zecUw92XgmrDTpmYDJ+bWeiZ3I4USeCvAvrNblBNMVo/bJXvvNV2M2T
 Rkn7GhSGMcgQIa76sgpyGpdKgmNMvNibCCGlw7lwJ+Y9MxIyNGSgJ/IkZbyn7j/rPd
 xopIiph9c6NMqICzJUO0XL7G8oJm+nO7ps0zP/z3AktHuIn+CoDwm9JGjBzUMey3eK
 +5qbQBJ5uWYrA==
Received: by mail-ej1-f52.google.com with SMTP id r13so20531280ejd.5;
 Fri, 04 Mar 2022 15:45:15 -0800 (PST)
X-Gm-Message-State: AOAM531IvMQHy/91uEWe+iN2v3edeKS1I2QdC6TATFftWQNDsNY78ADv
 oWr7IbCWnWKD05atYxc0T5kVuktvLrdbfgpf0w==
X-Google-Smtp-Source: ABdhPJxYS0br7Fg3mai1Y52kvgn22FUhmJLrfoIufPjrILVKI7waYv7yh1S/8ojIS55W4FhA8IZFUbN9+nd9WWD+qnA=
X-Received: by 2002:a17:906:b348:b0:6cf:5b66:2f80 with SMTP id
 cd8-20020a170906b34800b006cf5b662f80mr903212ejb.638.1646437513692; Fri, 04
 Mar 2022 15:45:13 -0800 (PST)
MIME-Version: 1.0
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
 <20220304095458.12409-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220304095458.12409-3-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 5 Mar 2022 07:45:02 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9m06C63xXQqDSZeV2ZojEqE_Hb+V8stPc1x4oUdD5OGA@mail.gmail.com>
Message-ID: <CAAOTY_9m06C63xXQqDSZeV2ZojEqE_Hb+V8stPc1x4oUdD5OGA@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: display: mediatek,ovl: Fix 'iommu'
 required property typo
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, krzysztof.kozlowski@canonical.com, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, CK Hu <ck.hu@mediatek.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, Jason-JH Lin <jason-jh.lin@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-stm32@st-md-mailman.stormreply.com, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_154518_438021_D5242BF1 
X-CRM114-Status: GOOD (  15.00  )
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

SGksIEFuZ2VsbzoKCkFuZ2Vsb0dpb2FjY2hpbm8gRGVsIFJlZ25vIDxhbmdlbG9naW9hY2NoaW5v
LmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+IOaWvAoyMDIy5bm0M+aciDTml6Ug6YCx5LqUIOS4i+WN
iDU6NTXlr6vpgZPvvJoKPgo+IFRoZSBwcm9wZXJ0eSBpcyBjYWxsZWQgJ2lvbW11cycgYW5kIG5v
dCAnaW9tbXUnLiBGaXggdGhpcyB0eXBvLgoKQWNrZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5r
dWFuZy5odUBrZXJuZWwub3JnPgoKPgo+IEZpeGVzOiA0ZWQ1NDVlN2QxMDAgKCJkdC1iaW5kaW5n
czogZGlzcGxheTogbWVkaWF0ZWs6IGRpc3A6IHNwbGl0IGVhY2ggYmxvY2sgdG8gaW5kaXZpZHVh
bCB5YW1sIikKPiBTaWduZWQtb2ZmLWJ5OiBBbmdlbG9HaW9hY2NoaW5vIERlbCBSZWdubyA8YW5n
ZWxvZ2lvYWNjaGluby5kZWxyZWdub0Bjb2xsYWJvcmEuY29tPgo+IC0tLQo+ICAuLi4vZGV2aWNl
dHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG92bC55YW1sICAgICAgfCAy
ICstCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4g
ZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21l
ZGlhdGVrL21lZGlhdGVrLG92bC55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRp
bmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssb3ZsLnlhbWwKPiBpbmRleCA5M2Q1YzY4YTJk
YmQuLmZjNjkxZDAwYzYwZSAxMDA2NDQKPiAtLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxvdmwueWFtbAo+ICsrKyBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG92
bC55YW1sCj4gQEAgLTc1LDcgKzc1LDcgQEAgcmVxdWlyZWQ6Cj4gICAgLSBpbnRlcnJ1cHRzCj4g
ICAgLSBwb3dlci1kb21haW5zCj4gICAgLSBjbG9ja3MKPiAtICAtIGlvbW11Cj4gKyAgLSBpb21t
dXMKPgo+ICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPgo+IC0tCj4gMi4zNS4xCj4KCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
