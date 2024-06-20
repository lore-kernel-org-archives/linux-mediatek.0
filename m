Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55365C27C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jun 2024 21:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9JJShizHW6+26Nm609dCnIBkr7rhSHsiUz2a74VNgo=; b=aNICBlpLPnof3pXo7v9Zkbx0Pa
	79An/nYwXD7hd4EILwbrgU8wnaW4btyowa31ronovQqVpBT5sJL0zi6GY0E87oW74gR+MQ+4z459U
	Mrk1gHshTYAYjc2J0pQ6gqNuYXNuUwAxn0t+zHadLTOCCYTnzQqVOy9orAyf3EqX9zhSo5c84oKSE
	bDnp/XPNkjuzOhA1NGELTMPlnVH9tqWPNQ06TuCQne2XqQmtGNZPdsB8GskpWmtfY2Gu2TfDWn6mb
	2K2F625klZSS6TNBBIXeY87XePX83HfpgGXcQ3HD8IjkSADvSTCeImaoTZRhZClvktpE7elhMzCI3
	6gHb5hHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKPHN-00000006lak-3Smw;
	Thu, 20 Jun 2024 21:25:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKPHL-00000006lZ9-0syi
	for linux-mediatek@lists.infradead.org;
	Thu, 20 Jun 2024 21:25:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718918709;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f9JJShizHW6+26Nm609dCnIBkr7rhSHsiUz2a74VNgo=;
	b=HpwQRGPHg1pzbwbxTH55iyMKRd3bku8K2JJ/pBQ89ttjEmTh4KN2zmhuapIPnWYfG1b03N
	tdEUMIZTCObGgSE5EQC4xxTyOcDdyzN9CoMvd/+3RPpxcCVZP4V5iP1grNiTmIp+ZFY/qS
	SMGaHJKojlZ9LujLL+DGw6n7abV3Ai0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-210-lt6vM_BlMZK__a0xw5PoAw-1; Thu, 20 Jun 2024 17:25:08 -0400
X-MC-Unique: lt6vM_BlMZK__a0xw5PoAw-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-363e84940b2so651335f8f.3
        for <linux-mediatek@lists.infradead.org>; Thu, 20 Jun 2024 14:25:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718918707; x=1719523507;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=f9JJShizHW6+26Nm609dCnIBkr7rhSHsiUz2a74VNgo=;
        b=u6d1AKxqZYNB3wQBmP0IFhglQu1K/lxq1d9Q+IoRZY4d/dWhC2Ul7Zkv64l3PDQwb8
         Dh+9VT3ilcukCozYVR8nC99oqRvqWLJmu3JV1hzjK1DdPC5X+AzNAr3UtJIfEAHhiZbm
         7iGNIh0JFDnmGp2oRj1+mNxRh4O5YYnzsKhKiEDx/Y4FiRYQAA1RBJGmLSmMJNeXqLTr
         GIjloSsQSRYQk4mqOFRHRdd+3s6bfeQhdg1DX3HrTL1P0RaeGnF2fkIy61rEk5EQBFjg
         rMx3790qaXaqmeg3ozMrmEPkHtZlx6yA48j2YXeRs3km9ar4m+TJ22t9/vz5GlBntNlt
         OvBA==
X-Forwarded-Encrypted: i=1; AJvYcCWv3ptVWaiEA6jolLot49dEZUj20G3urnDRf0h7q17B5sBuAjJWnkF0JSNXpV2SRz7n1TVGpOo6Ji7uIKEsgA9wm2JIWosyr3QMpgnW60+twNdJ
X-Gm-Message-State: AOJu0YxmDvey7UFiLsBefKCMpYVX2Q0Hv3+mNQyARt1pwsb7ML4SOzio
	8S2uKFlfmI6I255fsAVLpkBA+8w63uUlK2JP0N1AQgMKLRsJFhZAGh6kS9FIE+1na4hxFo4EF+W
	iOz5cLneJYx/Vm1ZcmNq84/n/300/YMvuSr2PDBigfxmhnxtsZV1GXVme3Sc+XGMHC8eglDT5o5
	711XNM1/ah4JrsuAr5fzhHuZW5iL16x+FEgfyJgle5wkrX
X-Received: by 2002:a05:600c:258:b0:423:3f3:ba9d with SMTP id 5b1f17b1804b1-4247517db46mr50211415e9.17.1718918707009;
        Thu, 20 Jun 2024 14:25:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaBsjAt7HYoRlIFrc5qpLHiI59NGO2TVUO9sqzR9IetjhlwXnL5MlgKewv4Xldk70LZ3RNqpOnHHSjyM9x5BM=
X-Received: by 2002:a05:600c:258:b0:423:3f3:ba9d with SMTP id
 5b1f17b1804b1-4247517db46mr50211335e9.17.1718918706671; Thu, 20 Jun 2024
 14:25:06 -0700 (PDT)
MIME-Version: 1.0
References: <20240620054708.2230665-1-wenst@chromium.org> <20240620212142.461771-1-pbonzini@redhat.com>
In-Reply-To: <20240620212142.461771-1-pbonzini@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 20 Jun 2024 23:24:54 +0200
Message-ID: <CABgObfZTbszy8ruotPCA4O+u5C2wDXSfnaWo0mBNF3RbJwUNhA@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: select DRM_GEM_DMA_HELPER if DRM_FBDEV_EMULATION=y
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_142511_337916_B631DC8C 
X-CRM114-Status: UNSURE (   4.53  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jun 20, 2024 at 11:21=E2=80=AFPM Paolo Bonzini <pbonzini@redhat.com=
> wrote:
> Queued, thanks.

Oops, a script started sending "queued" messages for everything that
had "y" in the subject. Sorry about that.

Paolo


