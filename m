Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838BFC433EF
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 15:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u7wZUCk7khiRBJMUAcck9Q7nkZjw708nvZ1OcgnW4ms=; b=4WLmk3y4uhfeqG
	C5QQIucYgEuksnZk4GfqjQNqYcyaLrSyIKOxk5ZJFBl6SvEp2koijUESW+9iIEGJbhdNusTKGJ3gX
	is0t8z/mRQo7NW9ZHVv5sJRJatxTBWEIr4Ad2Oq/SvA9bJPRLxPTEvZ1gew+ZOkVXUD6Q97ejnXzF
	4zwF6kOtgP9DLSu7PVFDlkOfzzFm0uP67dUHo29Xp7GYcyDAy+1EyVIM52umrqui+zzMq3RxS8jNj
	kwULcT/Z/mz4ziR2W8qS9bBK6Jk80BiLYXT6I0N/xLI7pDq++ViVt1xXSVwjOZzDKjoYIPOpqpchd
	1bRDuvP9Pa13G0nVFzfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUVMt-00DT1g-R6; Wed, 16 Mar 2022 15:15:19 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUVKY-00DRxT-Nh; Wed, 16 Mar 2022 15:12:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7523261618;
 Wed, 16 Mar 2022 15:12:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13B2C340F3;
 Wed, 16 Mar 2022 15:12:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647443571;
 bh=VE2DXOOKaALNyxqEYAqcoNhJQKuXktb8DsEEEWfPm7o=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=oCX68D9wEM8MvGW4hb57YAovriw4woglHyo8ypN2hogZPfIM1X5BLPhsyEHQrIe/C
 4oZtCtKADSf9WH4hvAIfqOzVjBYeHqxZvFU9UWGE8l+g/bXCQ9dHrKETZScv1VkC/P
 um5J0EsF6Y3zm7N9yXa6S1JWFUlnQa0BDTxRSyHpUqp1TlNkG96k65QCJD/TUPPNEl
 rRVWGzcRlNiId83N21mAe8ABvO/J+fmtjubV2rWW9i2iJS4lKIDFZA+pUsoKq/Ld2Y
 9EYN8PooW9ZNlBjk1I+Zc8mkLDhm/7GTQzt5Y8XV9P5BbJgA0ET5lE0EdZzqTcHb4N
 4HT/BIVJR75Rw==
Received: by mail-ej1-f47.google.com with SMTP id d10so4827762eje.10;
 Wed, 16 Mar 2022 08:12:51 -0700 (PDT)
X-Gm-Message-State: AOAM532RIkDmnTBpnuSvRjRtAoS1qId3iwJfvT9f8YqXselTGzoopPu1
 D4XVd7rXPLMfmlTUuF3ede0YsnYTjPgFkSPl8w==
X-Google-Smtp-Source: ABdhPJxH6AKaRwRhd04EuZiQxCRbgcOf0ZjvjbnJCf4qreX1Iy/cGxh/T+kaHO+5f78cTLXQ26lxsW6xxxAaU5Wqgzo=
X-Received: by 2002:a17:906:3583:b0:6d1:c07:fac0 with SMTP id
 o3-20020a170906358300b006d10c07fac0mr312656ejb.749.1647443569882; Wed, 16 Mar
 2022 08:12:49 -0700 (PDT)
MIME-Version: 1.0
References: <20220118133759.112458-1-angelogioacchino.delregno@collabora.com>
 <CAAOTY__59-tYZNAQqFytdZgAYs+hmFxHUrF1FAj4zphiguv12g@mail.gmail.com>
 <e4b16e67-ccb5-78d1-bbbb-a4a7f82b7c11@collabora.com>
In-Reply-To: <e4b16e67-ccb5-78d1-bbbb-a4a7f82b7c11@collabora.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 16 Mar 2022 23:12:32 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-3zZvu32gWeactYOfDX4i3O6HhPcZp1XHCvAPDZU1a+A@mail.gmail.com>
Message-ID: <CAAOTY_-3zZvu32gWeactYOfDX4i3O6HhPcZp1XHCvAPDZU1a+A@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: mediatek: mtk_drm_plane: Use kmalloc in
 mtk_plane_duplicate_state
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>,
 Collabora Kernel ML <kernel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220316_081254_887958_619EB2CF 
X-CRM114-Status: GOOD (  17.42  )
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
LmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+IOaWvAoyMDIy5bm0M+aciDE25pelIOmAseS4iSDkuIvl
jYg2OjQw5a+r6YGT77yaCj4KPiBJbCAyNS8wMS8yMiAxNzozNiwgQ2h1bi1LdWFuZyBIdSBoYSBz
Y3JpdHRvOgo+ID4gSGksIEFuZ2Vsb0dpb2FjY2hpbm86Cj4gPgo+ID4gQW5nZWxvR2lvYWNjaGlu
byBEZWwgUmVnbm8gPGFuZ2Vsb2dpb2FjY2hpbm8uZGVscmVnbm9AY29sbGFib3JhLmNvbT4g5pa8
Cj4gPiAyMDIy5bm0MeaciDE45pelIOmAseS6jCDkuIvljYg5OjM45a+r6YGT77yaCj4gPj4KPiA+
PiBUaGVyZSBpcyBubyBuZWVkIHRvIHplcm8gb3V0IHRoZSBuZXdseSBhbGxvY2F0ZWQgbWVtb3J5
IGJlY2F1c2Ugd2UgYXJlCj4gPj4gZHVwbGljYXRpbmcgYWxsIG1lbWJlcnMgb2Ygc3RydWN0IG10
a19wbGFuZV9zdGF0ZTogc3dpdGNoIHRvIGttYWxsb2MKPiA+PiB0byBzYXZlIHNvbWUgb3Zlcmhl
YWQuCj4gPgo+ID4gUmV2aWV3ZWQtYnk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJu
ZWwub3JnPgo+ID4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEFuZ2Vsb0dpb2FjY2hpbm8gRGVs
IFJlZ25vIDxhbmdlbG9naW9hY2NoaW5vLmRlbHJlZ25vQGNvbGxhYm9yYS5jb20+Cj4gPj4gLS0t
Cj4gPj4gICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2RybV9wbGFuZS5jIHwgMiArLQo+
ID4+ICAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCj4gPj4K
Pgo+IEhlbGxvLAo+Cj4gdGhpcyBzZXJpZXMgd2FzIHNlbnQgYW5kIHJldmlld2VkIHR3byBtb250
aHMgYWdvLCBidXQgaXQgaGFzbid0IGJlZW4gcGlja2VkCj4gaW4gYW55IG1haW50YWluZXIgdHJl
ZS4KPgo+IFRoaXMgaXMgYSBmcmllbmRseSBwaW5nIHRvIG5vdCBsZXQgdGhlc2UgdHdvIHBhdGNo
ZXMgdG8gYmUgbG9zdCBhbmQgZm9yZ290dGVuLgoKRm9yIHRoaXMgc2VyaWVzLCBhcHBsaWVkIHRv
IG1lZGlhdGVrLWRybS1uZXh0IFsxXSwgdGhhbmtzLgoKWzFdIGh0dHBzOi8vZ2l0Lmtlcm5lbC5v
cmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L2NodW5rdWFuZy5odS9saW51eC5naXQvbG9nLz9o
PW1lZGlhdGVrLWRybS1uZXh0CgpSZWdhcmRzLApDaHVuLUt1YW5nLgoKPgo+IENoZWVycywKPiBB
bmdlbG8KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxp
bnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVk
aWF0ZWsK
