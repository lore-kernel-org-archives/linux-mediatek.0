Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5A3E68966
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Oct 2024 09:36:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=InN1xFa4g9RMlT4oK3tOjutPsAyzphU02LuhXMsZALM=; b=SDXM6lt/n+Zm4aYX+EuRKQT7wm
	PTRMnnMFmxdt5yG6VfRELH2yx9j7hvIsoAf00xqI2/N3dDLDDC1HuQZ2OBC/8nqe5Jsv1YCDBYdaH
	SjGM5ntb5nyDdWdW5Hof+IKyR7a2n+JrOqlrGo7X/NzAQT8CllIy18GXuYeWgzFlmmKazVRwzPxVU
	RqBNLuKQri23IjjcV9pcWDnX9QbxmPEtoz3RD9NG9r0jaOD8EPu/Kh8vsI5ZZjLOF7CaBs+gr/ejv
	rOU0wtKsqD6X4cDUFww2LWw4Ol6n3aashChXf3nbBejxfhFb2N+ifX4zOWjsRg1CBJDuzKjB+u8Pv
	IQXgr+Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Rb2-000000036UH-1SwA;
	Thu, 31 Oct 2024 09:36:04 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6RZY-0000000365N-1rZJ
	for linux-mediatek@lists.infradead.org;
	Thu, 31 Oct 2024 09:34:33 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-53c78ebe580so848349e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 31 Oct 2024 02:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730367270; x=1730972070; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=InN1xFa4g9RMlT4oK3tOjutPsAyzphU02LuhXMsZALM=;
        b=mheks/T6H2Y9qrShfmZojZN9sCXaaOEm3Z/D4dOa4JZ1iA6QlL0z7rMmYo9C+T7h+a
         ItSkRU6rrmtv8CtoBe4tR5HE3HqnJ6nGFBuIstCwJ4gQADQlvQksOq/EjvQz90aDGZt3
         R9t9G18HbGab0CXud6i395La46vie1u0DWO50=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730367270; x=1730972070;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=InN1xFa4g9RMlT4oK3tOjutPsAyzphU02LuhXMsZALM=;
        b=BOo6RGk8sOu6s13+AFX2tVYqMEDpk3XfcWhzfXAZxCZDFvabfMnkh1kn768Oo4HMJ9
         QFaQK2+x8FLhl7e+MDmfzIk6Q7b5dV5BCvpA3wVbxCA9HXr+G7uBjWUyTRfrDr3CAcjv
         W3J4ebir/48tgTpE3FPzohDJCegQ3lzDfmuZ2sZPSBKw03oZ1jI7l0ir0akzvF3Eb6Mm
         DMHCVaBpZ2ea0vw4Owr0Aq5nLmiAUnlyCTM6WA+PGSXK4Cmsk0ZsNHC6E27x3imtOU3q
         4O2f68B7AMgVugS0L1niuduafmPqDfd+CdACjwk8yGmIUUd6uN13S5nZfRPPhclU/HKj
         UqLg==
X-Forwarded-Encrypted: i=1; AJvYcCU32Th6yBYF+LJ1aChSlZMBGZu/4tH1Hk4ZBJEwbjULtVBvr65Dt+JNXMlMJna/MjgimfUO2Rmo5CkHcyuWAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxY75BzX+7kzW8Qx74Uz0KhJmPoh0w5Pc8YqhSY9P2dhYAPSnf+
	daw5EQyYgUgODX5dJ6zrphAP/6KVoxsfXo5jfyN34fiGWuzwida4KTecPwuJm9jx52xzanzb5Xi
	jHLKoOgtzCvSDRvZk/+VgcF/hYFZgRGmNZesK
X-Google-Smtp-Source: AGHT+IHX8IaTSony3Ug7y1qw915U2fjctGRizSyZJqMGGKqXUXcFSb5o6pqwOsBeJtryiF2PWRQTbhcS2j/8glKC0bU=
X-Received: by 2002:a05:6512:3d10:b0:539:fd75:2b6c with SMTP id
 2adb3069b0e04-53c7bc369b8mr554550e87.21.1730367269718; Thu, 31 Oct 2024
 02:34:29 -0700 (PDT)
MIME-Version: 1.0
References: <20241029111309.737263-1-wenst@chromium.org> <d9177ba80fc78b1f74dc54260c0c43440ec5a804.camel@mediatek.com>
 <20241030-hot-peridot-falcon-57bdbb@houat> <0cfba5bdc9443fb4b9719c47ee93c2a467cc66bd.camel@mediatek.com>
 <CAGXv+5EWyGGKYo+NNQ3Ykd3QUUO2cOManSnhZQaVhhCnupNx=Q@mail.gmail.com> <20241031-turkey-of-astonishing-reputation-d1de20@houat>
In-Reply-To: <20241031-turkey-of-astonishing-reputation-d1de20@houat>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 31 Oct 2024 17:34:18 +0800
Message-ID: <CAGXv+5HkxbjTH6oidYMYo9vQafev2S+a-+Yrs=+TNqs9sSUtZg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Drop dependency on ARM
To: "mripard@kernel.org" <mripard@kernel.org>
Cc: =?UTF-8?B?Q0sgSHUgKOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>, 
	"simona@ffwll.ch" <simona@ffwll.ch>, 
	"ville.syrjala@linux.intel.com" <ville.syrjala@linux.intel.com>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, 
	"maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>, "airlied@gmail.com" <airlied@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241031_023432_522992_F58C8670 
X-CRM114-Status: GOOD (  27.26  )
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

On Thu, Oct 31, 2024 at 5:30=E2=80=AFPM mripard@kernel.org <mripard@kernel.=
org> wrote:
>
> On Wed, Oct 30, 2024 at 04:52:17PM +0800, Chen-Yu Tsai wrote:
> > On Wed, Oct 30, 2024 at 4:48=E2=80=AFPM CK Hu (=E8=83=A1=E4=BF=8A=E5=85=
=89) <ck.hu@mediatek.com> wrote:
> > >
> > > On Wed, 2024-10-30 at 09:25 +0100, mripard@kernel.org wrote:
> > > > On Wed, Oct 30, 2024 at 03:30:34AM +0000, CK Hu (=E8=83=A1=E4=BF=8A=
=E5=85=89) wrote:
> > > > > Hi, Chen-yu:
> > > > >
> > > > > On Tue, 2024-10-29 at 19:13 +0800, Chen-Yu Tsai wrote:
> > > > > > External email : Please do not click links or open attachments =
until you have verified the sender or the content.
> > > > > >
> > > > > >
> > > > > > The recent attempt to make the MediaTek DRM driver build for no=
n-ARM
> > > > > > compile tests made the driver unbuildable for arm64 platforms. =
Since
> > > > > > this is used on both ARM and arm64 platforms, just drop the dep=
endency
> > > > > > on ARM.
> > > > >
> > > > > Reviewed-by: CK Hu <ck.hu@mediatek.com>
> > > > >
> > > > > I find this days ago, but I don't know there is someone who apply=
 it.
> > > > > Let this patch go through drm-misc tree which already has the bug=
 patch.
> > > >
> > > > If you are ok with this patch, why didn't you apply it yourself?
> > > >
> > > > I think that's very much the expectation, so it's probably took a w=
hile to merge.
> > >
> > > That's ok for me to apply it if drm-misc has no plan to apply it.
> >
> > I'm confused. The culprit patch is already in drm-misc. So this one has
> > to go in drm-misc as well.
> >
> > I can try to apply it to drm-misc myself, or have a colleague assist wi=
th
> > that. I'll let it sit for another day in case anyone has something to s=
ay
> > about it.
>
> Sorry, I was under the assumption that CK had drm-misc commit rights? It
> should go through drm-misc indeed.

CK has always maintained a separate tree on git.kernel.org, so I don't know
if drm-misc commit rights were ever granted?

ChenYu

