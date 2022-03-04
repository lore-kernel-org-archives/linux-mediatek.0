Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3742C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Mar 2022 23:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WOnnmbxHT6IFVOA/1o0HpF5peTFoHs9EPwUV0Zs+1Go=; b=arserTZB0mNvFf
	qkH5GxfOagmdAZLWqQnTH+a1zNqrt/9+dBpjckGVONUv1XEDrDo4WHb6XTI7k7VNbrg5OA72a4vgM
	2RaWDzOBpJo03KND4xPXgpe4JErf8Uxyk/FxC6pcJ17BBle+UM2e9xrki3z69t0qxSaHghGFPN13x
	G9iwr0yFZAfDUPwIrGHUoR3jl48wpza/LAL5woYHkd/qvte5ZYGb3fRwOoC27uhTdvBK2OourRspt
	Nnzn+odn+fsa/GtkV+b+J57bmyoWpClhmvJaLOwOFWOk4gC+mSL7n/ONiWoRKV4GECLvRLKpob2+R
	5gEORK7fPB9/iihVvk+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQHap-00CN2U-Pd; Fri, 04 Mar 2022 23:44:15 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQHac-00CMz8-Q8; Fri, 04 Mar 2022 23:44:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id AFC03B82C73;
 Fri,  4 Mar 2022 23:44:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FD80C340F1;
 Fri,  4 Mar 2022 23:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646437439;
 bh=16b3mHxGo7CXPa/opMj9XBta1y9/zRDIU0OwsIYy1LM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=lNE1FWE2VLO2AASJfC6duh+flMjHcAj1hpQGW1NHjm8rPyER1vCT/bMTz+9AcyR7i
 MpTwzcfAVei4VFMKtHZC7Ps9vRilwLDx1jNRvVhNhh1+ezFm7qN6AFK9xnsDB3CckR
 nq/xkhI1YvAHwckPcgt2NhE5m1yqtqCcNwjtSiqsfKWWZH/zaJNj8gN3aoHvgfiwG5
 LfHAo0OBP/45GsZB/4IQEvjjf+XAt0GaqfE4cneDTgx3Ed1NCEROCBOAfxfR3Tuc6Q
 xPSixbOi/gs5bGgO4hINtSbAOHIYppnlrcmpPXKWD0NxhN4Hng8NQkgpHZRx8zNgsO
 la4b07wrtmq8w==
Received: by mail-ej1-f50.google.com with SMTP id bg10so20539070ejb.4;
 Fri, 04 Mar 2022 15:43:59 -0800 (PST)
X-Gm-Message-State: AOAM533jR54mmwWCl8fGGCihsYvgJ4hoh1p/FYUyru6TGkFVtnCYftpT
 teUcpbbfOhCdEpKekO+VdXqXoRumYaaaKIFSGg==
X-Google-Smtp-Source: ABdhPJwnZliVE4KHmolx7T1uMZ0t0Ia2+Lso1v5G32G3bJxHN2JjX0zgzbElexB7kKBvJcmKTP8sZXJn0s/5C8B2wqE=
X-Received: by 2002:a17:907:3f8d:b0:6d5:bb03:c4c6 with SMTP id
 hr13-20020a1709073f8d00b006d5bb03c4c6mr953594ejc.680.1646437437567; Fri, 04
 Mar 2022 15:43:57 -0800 (PST)
MIME-Version: 1.0
References: <20220304095458.12409-1-angelogioacchino.delregno@collabora.com>
 <20220304095458.12409-2-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220304095458.12409-2-angelogioacchino.delregno@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 5 Mar 2022 07:43:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8TSQ+-LW4jRK28=G1CcwJBXYmXsgHMadaAScd7APtjNA@mail.gmail.com>
Message-ID: <CAAOTY_8TSQ+-LW4jRK28=G1CcwJBXYmXsgHMadaAScd7APtjNA@mail.gmail.com>
Subject: Re: [PATCH 1/3] dt-bindings: display: mediatek, mutex: Fix mediatek, 
 gce-events type
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, DTML <devicetree@vger.kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, krzysztof.kozlowski@canonical.com, 
 David Airlie <airlied@linux.ie>, Jason-JH Lin <jason-jh.lin@mediatek.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, 
 linux-stm32@st-md-mailman.stormreply.com, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220304_154403_187018_92290F65 
X-CRM114-Status: GOOD (  17.91  )
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
iDU6NTXlr6vpgZPvvJoKPgo+IFRoZSBtZWRpYXRlayxnY2UtZXZlbnRzIHByb3BlcnR5IG5lZWRz
IGFzIHZhbHVlIGFuIGFycmF5IG9mIHVpbnQzMgo+IGNvcnJlc3BvbmRpbmcgdG8gdGhlIENNRFEg
ZXZlbnRzIHRvIGxpc3RlbiB0bywgYW5kIG5vdCBhbnkgcGhhbmRsZS4KCkFja2VkLWJ5OiBDaHVu
LUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBGaXhlczogNGVkNTQ1ZTdk
MTAwICgiZHQtYmluZGluZ3M6IGRpc3BsYXk6IG1lZGlhdGVrOiBkaXNwOiBzcGxpdCBlYWNoIGJs
b2NrIHRvIGluZGl2aWR1YWwgeWFtbCIpCj4gU2lnbmVkLW9mZi1ieTogQW5nZWxvR2lvYWNjaGlu
byBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4KPiAt
LS0KPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxt
dXRleC55YW1sICAgIHwgMiArLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEg
ZGVsZXRpb24oLSkKPgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxtdXRleC55YW1sIGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssbXV0ZXgueWFt
bAo+IGluZGV4IDZlY2E1MjVlY2VkMC4uODQyYmE3YjA3YTM0IDEwMDY0NAo+IC0tLSBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLG11
dGV4LnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9tZWRpYXRlay9tZWRpYXRlayxtdXRleC55YW1sCj4gQEAgLTU4LDcgKzU4LDcgQEAgcHJvcGVy
dGllczoKPiAgICAgICAgVGhlIGV2ZW50IGlkIHdoaWNoIGlzIG1hcHBpbmcgdG8gdGhlIHNwZWNp
ZmljIGhhcmR3YXJlIGV2ZW50IHNpZ25hbAo+ICAgICAgICB0byBnY2UuIFRoZSBldmVudCBpZCBp
cyBkZWZpbmVkIGluIHRoZSBnY2UgaGVhZGVyCj4gICAgICAgIGluY2x1ZGUvZHQtYmluZGluZ3Mv
Z2NlLzxjaGlwPi1nY2UuaCBvZiBlYWNoIGNoaXBzLgo+IC0gICAgJHJlZjogL3NjaGVtYXMvdHlw
ZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZS1hcnJheQo+ICsgICAgJHJlZjogL3NjaGVtYXMv
dHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyLWFycmF5Cj4KPiAgcmVxdWlyZWQ6Cj4gICAg
LSBjb21wYXRpYmxlCj4gLS0KPiAyLjM1LjEKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1l
ZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFp
bG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
