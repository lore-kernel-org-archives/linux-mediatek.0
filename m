Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80778D0BB63
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Oct 2024 06:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Uhdy0crX7jd32UBgalA4Mp+yqTEKMoy5/aHTmMprIHY=; b=e+YqBFfA4yLrWhmcM/BZkUD0MD
	i61BiWvfZ9XBl/nnlWUdDSr/3HO06Lk2NxxIe2+pmu51qiFrJzrkmLGK+QVziS9qwAYFXPYmOfumL
	xEGO/a5iJ6979mVgI5X7Fq4/5+k0acjKuC7e4tZApCfIekgcxVQRl0CAjyQhxGgLY7RzfBJ5NdcKW
	ZCgvhOoPxzmKneqxUSP8UbLjiQvbKhLL+YPYiYPttFO5YKavivnGhjEKWvOEeQXAYUiUJAUacg+Wv
	GoNNsB7TsQCbyQClCIqlkmYnD2YQOukRYviN0zlXfxn4i0n+qWbxqCqHDlA3VruLwy+LZx7glLvHT
	aKwq18Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rLq-0000000GvVN-1vCe;
	Thu, 24 Oct 2024 06:29:42 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3rFl-0000000GuO7-3Zxt
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Oct 2024 06:23:31 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-71e681bc315so398134b3a.0
        for <linux-mediatek@lists.infradead.org>; Wed, 23 Oct 2024 23:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729750965; x=1730355765; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uhdy0crX7jd32UBgalA4Mp+yqTEKMoy5/aHTmMprIHY=;
        b=pqZPENRi4vcgry1dWwiNFvHpqR7YBD+QQfPVCZ79WR5YQt8JNybvBhgv6Xm48+M2kz
         wt//wz5JtiDhuKIiZqsa8/mPkqtFdAtJVTPa0QCpYjVAqaj4Aw7Pqu/48ojoB5mdctDl
         IGKrQKQhN+D6OGelKMop1a5s9I18rrj22l0bJTaLVARr/Kls7fjL8mrTz/BnnQs75pvw
         ZPIOXIy986xn1niDdPjjrHadV5CQaAZTmFzG4K1ZZnNwc7t0UL3IsPheKlxcxQCT9B2O
         A607LB6s9gcb7j4zE+EegoGnja0LLmfnFlSNO2xazN86kxWNXeUIkWhIWRChw+Cey4H1
         z+8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729750965; x=1730355765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uhdy0crX7jd32UBgalA4Mp+yqTEKMoy5/aHTmMprIHY=;
        b=fYogFGZebZy6mUsq//o3DW4vAa90TT+i/fsOzeoaUeTn/UOYDLCY3GSapxrsmItYF2
         tiDczi6qjfiA0OYHEBFI3kaPFKvffg1I/g7gVfgEmgh0OoZpvXyFjLuHbhLSOkdCjOH4
         e7zeac+kJLnD/okmDR+v9VGRueDDKUxsMNgfp9XiYArmYxoEfWl0tcaIzngIBjYt/74N
         vpfMyQYgQjVp9HcNI3yY1AXuE5669FzUnMODzZsC7liUpiEywcvv8JHqbD5iui0fo2k6
         xnCx1xAPNOrZOAz+eVvsOCsniYCcYsKGZtvOwOtSRA8FbUfmxVIcJkakf5lxmjWVdy6h
         wmkA==
X-Forwarded-Encrypted: i=1; AJvYcCWw6ZSiKOj11DViat/qSh49Y88YBhX7g/aL0e8eBhz9ft8C9r1P7w26R3i/KrFDfkANDht1reejgp+dSBdX3A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7WCnxEo3diuytKuvLPqS11097P7yPlbV/dFdnsjg9ZVbS5pkx
	chlIk1dTJILa9MBShJU77bV+UjEtGT9Hl4eRjRC9Ms+QwO0ikSg+iaPvOPFjig8n2YccgLLWLDj
	M/nTzJA4nFiQoabvQJu/i3/OisPoXFonvEiUrjRfn/g7ffhK7k3C7+6U=
X-Google-Smtp-Source: AGHT+IHER6S+oXayYMJOfU1uT2MMGdiQY9D03ESwl9edjBhrQ1nxNVeRSlMwT7VT0vKe79wJ+iS8Umue/ckpKLjd6Zk=
X-Received: by 2002:a05:6a00:888:b0:71e:6a99:4732 with SMTP id
 d2e1a72fcca58-720452dc06emr1742555b3a.11.1729750964614; Wed, 23 Oct 2024
 23:22:44 -0700 (PDT)
MIME-Version: 1.0
References: <20241023191339.1491282-1-saravanak@google.com> <7a8dede1-ef29-4553-9412-de8e2f45b860@notapiano>
In-Reply-To: <7a8dede1-ef29-4553-9412-de8e2f45b860@notapiano>
From: Saravana Kannan <saravanak@google.com>
Date: Wed, 23 Oct 2024 23:22:04 -0700
Message-ID: <CAGETcx_nSoVy-C-pt0Q3e-4wsU--9MJKoxr2ZSUfVq1UBxMjow@mail.gmail.com>
Subject: Re: [PATCH] drm: display: Set fwnode for aux bus devices
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jon Hunter <jonathanh@nvidia.com>, 
	kernel-team@android.com, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_232325_903614_2FFB2C2F 
X-CRM114-Status: GOOD (  17.00  )
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

On Wed, Oct 23, 2024 at 12:56=E2=80=AFPM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Wed, Oct 23, 2024 at 12:13:36PM -0700, Saravana Kannan wrote:
> > fwnode needs to be set for a device for fw_devlink to be able to
> > track/enforce its dependencies correctly. Without this, you'll see erro=
r
> > messages like this when the supplier has probed and tries to make sure
> > all its fwnode consumers are linked to it using device links:
> >
> > mediatek-drm-dp 1c500000.edp-tx: Failed to create device link (0x180) w=
ith backlight-lcd0
> > tegra-xusb-padctl 3520000.padctl: Failed to create device link (0x180) =
with 1-0008
> >
> > Reported-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
> > Closes: https://lore.kernel.org/all/7b995947-4540-4b17-872e-e107adca459=
8@notapiano/
> > Tested-by: "N=C3=ADcolas F. R. A. Prado" <nfraprado@collabora.com>
> > Reported-by: Jon Hunter <jonathanh@nvidia.com>
> > Closes: https://lore.kernel.org/all/20240910130019.35081-1-jonathanh@nv=
idia.com/
>
> Hi Saravana,
>
> the issue faced by Jon needs the exact same change but in a different pla=
ce,
> drivers/phy/tegra/xusb.c, which I posted at:
> https://lore.kernel.org/all/f979aff2-34f4-4f6d-bb9a-03a02afc4635@notapian=
o/

Ah sorry, I was in a hurry and missed the fact it was a different file.

>
> So we need two separate patches, one for each issue. Feel free to add tha=
t to
> this series. (I could send it myself, but I think it makes more sense to =
keep
> them together)

Sent a new series. Thanks for the heads up and the fix for Jon's issue.

-Saravana

