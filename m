Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19442FDEE32
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Apr 2026 17:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xwtw0OJvGLE/Lum++zazpkBN2D4nXALffdNH3wQw0YE=; b=mI6aTftn2uMMW4Ez47SmVfJXkp
	pz2xofm+oiLxkuy2VXvzeEzwVM23xqFBu3SYNDxwtPOCwZe8Gy8JPSduzNB5ZBKjRff1V0Tl1C4zR
	xTMPLcwchJ+gNWI9ArPMjvzyvK2vxtOLZCf9CrIKxmEzJpgVZLz1BO/RZEK0Ihqm5co5et9N//6Ug
	RSrF8w6sdVG0huc+8aeEOcbLwmCoJzFK+FkW9wVJnkv1BJSfoZHz9RFSE2pvZcfm7gR/U8futjdi7
	opvIOFeILxQVeiRqeSlNvZrQJeNj/tRTfXOspRLVjAgDzDuOQNJJTlBlEjN/VDViPpo4IeKzVWsfO
	1vTb8JVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxyU-0000000C3qU-4AjI;
	Thu, 23 Apr 2026 17:36:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFxyR-0000000C3qB-3EBM
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Apr 2026 17:36:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DDD9744032
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2026 17:36:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEBFDC2BCC7
	for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2026 17:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776965782;
	bh=xwtw0OJvGLE/Lum++zazpkBN2D4nXALffdNH3wQw0YE=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=ohamrm1o8Z1E/xgWjSFDxDlknSNleOgeQbCp0ATK1BPeF44XQbhwrJICaj7SFv9cj
	 3CzPKG5ainaRsFAh5IVcfIaf46kshsY0xVwwwMQJL3AX3q2UKjVSQp7uphRp9REPzJ
	 hYaV5yRWHViuGNLdmscQsSWOjDndZu1trId3yOnVBUdLJAvPOyv1gUhy1NO0k9Jk0p
	 KyVNYyKjDjQ/zU/uF6y6QLNHKy802D61Qgc0B41SRDkKq02t+UUNoNY0vyyxxqS1XO
	 jzrZe7NUfWBH23BblQEuJ4TBcLm722QeX6jy4sSAEY3ijJceMVjT4Fqrtuv0qPBElf
	 C4Smh79HoY17A==
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38ccde812ecso68133171fa.0
        for <linux-mediatek@lists.infradead.org>; Thu, 23 Apr 2026 10:36:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+gCwX5EWrd5HTmlQk7RPfu8n0U+aPM5xFXamvLRakP86Ez7L2NCR/ENvoVMIYWSWfit73XhYw/VpcY+Qdy/w==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywo8sntoKVNWRBS59i+zEV0oar7Lu7i8FHVWAnLBo2P0JmYF3Vc
	GQsxnhKe+RwC4N9uHPtI6BIUEkvgDaJsdrAAF3GkAlUpPAzNR1G3rNZk+vRD9qjBXGsYMyBP1Uj
	HfCxhamp2Nm7Ew599Cgk6Ka75m2Nf8KQ=
X-Received: by 2002:a2e:878c:0:b0:38e:94c6:b706 with SMTP id
 38308e7fff4ca-38ec8ff15fdmr59864981fa.7.1776965781090; Thu, 23 Apr 2026
 10:36:21 -0700 (PDT)
MIME-Version: 1.0
References: <CAKHmtrSaDR4fBxN0mvEzYPHoOwr2rrtnOJW6fsrxzsBAeHTjQg@mail.gmail.com>
In-Reply-To: <CAKHmtrSaDR4fBxN0mvEzYPHoOwr2rrtnOJW6fsrxzsBAeHTjQg@mail.gmail.com>
From: Sean Wang <sean.wang@kernel.org>
Date: Thu, 23 Apr 2026 12:36:09 -0500
X-Gmail-Original-Message-ID: <CAGp9LzpG3QXdHxy_E-9mCat9bTDDNSnz_vMHYgSNiVzwF3dkrg@mail.gmail.com>
X-Gm-Features: AQROBzCAd4x1at669eIVKMLAV0sDSHEHFBd8wCOhg12KB7-ZuJ4KwsllBKzDQDA
Message-ID: <CAGp9LzpG3QXdHxy_E-9mCat9bTDDNSnz_vMHYgSNiVzwF3dkrg@mail.gmail.com>
Subject: Re: [PATCH v1] mediatek MT7925: update bluetooth firmware to 20260414153243
To: David Ruth <druth@chromium.org>
Cc: =?UTF-8?B?Q2hyaXMgTHUgKOmZuOeomuazkyk=?= <chris.lu@mediatek.com>, 
	ben@decadent.org.uk, dwmw2@infradead.org, johan.hedberg@gmail.com, 
	jwboyer@kernel.org, linux-bluetooth@vger.kernel.org, 
	linux-firmware@kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek <linux-mediatek@lists.infradead.org>, marcel@holtmann.org, 
	ss.wu@mediatek.com, steve.lee@mediatek.com, will-cy.Lee@mediatek.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_103623_855816_1D7FE9DA 
X-CRM114-Status: UNSURE (   5.20  )
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

On Wed, Apr 22, 2026 at 5:19=E2=80=AFPM David Ruth <druth@chromium.org> wro=
te:
>
> Tested-by: David Ruth <druth@chromium.org>
>

Merged
https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/1015

