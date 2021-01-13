Return-Path: <SRS0=H0vx=GQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA82EC433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 15:28:57 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EA02233EA
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Jan 2021 15:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EA02233EA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SLIDRzmmSi/+IvSGti8u77yCj+7mTd3+T6F7dIXnElc=; b=OOodEXOS3xTdInoIMFIKQ+Dcz
	fapWQrlF2Z1oOfimFJXHxq385ziq03M90V2q0s3cHzaLPG6Vgs+52yclyL7L/OoaAF9AhZbnU8Xn/
	W61n7+pjBg2JihaWzpZXWvWcaihVAN/pVuX9q8c82+lxT7dqBmSLUj3e6BUthPVmUOJ2nSFrfb5hG
	cvSq72uW3XGz3N2sg7QnAryFn/O/c49Vnby2YpRJ0PqO/EIvT2v5xBXPBWNuwild+Rho9IUhKv9Se
	vXcs3McfB8pvrWtHDTqmR0Xl1VjHpYldOZ81v+v/23k4fLK8jo2dIrM+eaZvQEM3WwhyHM6DSUp2M
	XvHJXewkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kzi4h-00032M-Rq; Wed, 13 Jan 2021 15:28:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kzi4R-0002uH-Vf; Wed, 13 Jan 2021 15:28:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1D60623437;
 Wed, 13 Jan 2021 15:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1610551706;
 bh=Mg2ARogJlO660LgGnPMrdN+6ikF0b/JxVj+vxajyk+Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZcVw6Lmqm06Cwx5kwFDHc7g8QO7QcfdqfDCEbWK6E61+n27+/N5vRQPntpD9SbrKI
 ABSRfhvQzozbH6dX5PN7rXGr6BjLU1ByuA6n7XQrTW0zSnH9R9dP0pWXq688j/KPv0
 qU/4Mg2JnZeG3NSUd71XnRBTKbaiagC+VLGTAf7RFYkiF1P+EGBSU2YdMIU9jwngJE
 IzwvZWaNRt/nRG3tTJa7RqhR9pZ5prVYX/36ahpqhJptAqYZc2Uh7pMRLfqmUOeAg/
 vuR7hxhMS9bKcKU/UTpkpRjuD1HRWpOizh3Rp4dJaht1WqnDnDJWMevIRiAflvG7h0
 VKoiv+bGw6U4Q==
Received: by mail-ej1-f50.google.com with SMTP id f4so3633996ejx.7;
 Wed, 13 Jan 2021 07:28:26 -0800 (PST)
X-Gm-Message-State: AOAM530DYQsHJeOpFcW4Q+66EwJIhrTWTH9qt3utqFVwR1vDe4gf7viN
 LUcT+ppneR9EbC/aTADUECuAFTuyKMBJZ9FvYQ==
X-Google-Smtp-Source: ABdhPJwSNSW5WjoC5vVbpHCVn5f5VMr7QuBDfdON7GWyYQI8ef3yATBL0johH1JdQeAE83K0V4Og53LZq9AnwQ2itKw=
X-Received: by 2002:a17:906:fb1a:: with SMTP id
 lz26mr1962502ejb.194.1610551704525; 
 Wed, 13 Jan 2021 07:28:24 -0800 (PST)
MIME-Version: 1.0
References: <1609989081-29353-1-git-send-email-yongqiang.niu@mediatek.com>
 <1609989081-29353-2-git-send-email-yongqiang.niu@mediatek.com>
 <20210112144921.GA330210@robh.at.kernel.org>
In-Reply-To: <20210112144921.GA330210@robh.at.kernel.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 13 Jan 2021 23:28:13 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9=TJw6Hj5UOWSJJh_O6B0Ue43LhtCpJwtJiG-93-kgAg@mail.gmail.com>
Message-ID: <CAAOTY_9=TJw6Hj5UOWSJJh_O6B0Ue43LhtCpJwtJiG-93-kgAg@mail.gmail.com>
Subject: Re: [PATCH v9, 01/11] dt-bindings: mediatek: add rdma-fifo-size
 description for mt8183 display
To: Rob Herring <robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210113_102828_131446_70E5AB02 
X-CRM114-Status: GOOD (  11.93  )
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
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Um9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4g5pa8IDIwMjHlubQx5pyIMTLml6Ug6YCx5LqM
IOS4i+WNiDEwOjQ55a+r6YGT77yaCj4KPiBPbiBUaHUsIDA3IEphbiAyMDIxIDExOjExOjExICsw
ODAwLCBZb25ncWlhbmcgTml1IHdyb3RlOgo+ID4gcmRtYSBmaWZvIHNpemUgbWF5IGJlIGRpZmZl
cmVudCBldmVuIGluIHNhbWUgU09DLCBhZGQgdGhpcwo+ID4gcHJvcGVydHkgdG8gdGhlIGNvcnJl
c3BvbmRpbmcgcmRtYQoKQXBwbGllZCB0byBtZWRpYXRlay1kcm0tbmV4dCBbMV0sIHRoYW5rcy4K
ClsxXSBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVu
a3VhbmcuaHUvbGludXguZ2l0L2xvZy8/aD1tZWRpYXRlay1kcm0tbmV4dAoKUmVnYXJkcywKQ2h1
bi1LdWFuZy4KCj4gPgo+ID4gU2lnbmVkLW9mZi1ieTogWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5n
Lm5pdUBtZWRpYXRlay5jb20+Cj4gPiAtLS0KPiA+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9k
aXNwbGF5L21lZGlhdGVrL21lZGlhdGVrLGRpc3AudHh0ICAgICAgIHwgOSArKysrKysrKysKPiA+
ICAxIGZpbGUgY2hhbmdlZCwgOSBpbnNlcnRpb25zKCspCj4gPgo+Cj4gUmV2aWV3ZWQtYnk6IFJv
YiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
