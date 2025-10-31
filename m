Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 221D1CCFA02
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Oct 2025 17:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0hkxia2CA9CPAPfjt95DlH0WVP9rnYiBKDpQymGAYoo=; b=ccmipTpR5QVXKqXHB4AaAE9pd6
	L8ukwm9JwhQbvXkvzdLwhUAlun0CiywhPFHS6ogmq6Bwo9bRMHPEn2hnSlkXQIAi0ivoHO3TPGwS4
	XLcvNibI9QdqDCWitT25HG2SGNC6J121QVxBjnK4Aji3JwxfZFwKuTRPStXzT4LFuWDlQwddeq+EJ
	qBxm6YALhktlZIqpE2RZWoYirygxnYKwmk5QGVcvj7kOygse4hnwIh+PCCyl7AeVCXoPIKTelZyp5
	YTX7vNjI/XTPoHoNxcX+e1MDqZT6FzuosvOJcb2zOzlqbr9FQ+eim1+gA38hHZF+qwKmbCpIQNmai
	Pa/SNc1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEtNj-00000006aaR-1TqO;
	Fri, 31 Oct 2025 17:57:47 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEtNd-00000006aYW-2vqK
	for linux-mediatek@lists.infradead.org;
	Fri, 31 Oct 2025 17:57:43 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-b6d83bf1077so524356866b.3
        for <linux-mediatek@lists.infradead.org>; Fri, 31 Oct 2025 10:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google; t=1761933460; x=1762538260; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0hkxia2CA9CPAPfjt95DlH0WVP9rnYiBKDpQymGAYoo=;
        b=KVI7UsaU5OEJpxxLAV2oTmwTdkGB3SWs8rQOc6fSgiuJ4KjiehOC24JXkBFJ5dWz7/
         xDXio6271Y9FIVPO+y5G/vpMBVbJ0DpnQlBXImWevR580WbKhO9ckSjO8pbZ7QyHk3lj
         +jdKyKNDCw+xqqvnwlTZ2tnTlXKpsdNw3gO0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761933460; x=1762538260;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0hkxia2CA9CPAPfjt95DlH0WVP9rnYiBKDpQymGAYoo=;
        b=Mi9wb9xHSlMoroNeCJv4oE+D/OTBpAQE80A5WXZU0gLhBSiHn9U8K4ni2NC8QL+mk1
         Ktl2hyRjEsIEi+M7dZpB4OP+DbSxFpNrzSOpTZjnamdmX5GuD1aWswmMsewKOkdJKK7z
         xMvylufYnS5EyoNWv9oVDW/xQMZbdmiAElIQqm2lauAT8xKepLRfFMYWpI4TlrGHvlFF
         I2SsKfnjjcXd9LPoAR6NuxqFRgIMo5r5wbwTnB87OeC+h34QZtWL+eAvQPd8WrqU/R5l
         SLduAGn/v2feTIP7AWREAXIUL4AcgwZA0u/AjTWWJd8nwlrh9KMfQZjybcyXIn1DSCOp
         n00A==
X-Forwarded-Encrypted: i=1; AJvYcCVQ98ksJsp4ErPnCYxLvna5ngeFtXDxU45bZhHrn33om6DjX+xJneZyAfAR6sRrCIwwvbOCniNd+zvmZtbaPA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwZ1nYX+IQg2w2rQ0gHEgKR8H0iv1dE1sGQwTi7XtjBP+cnHixC
	vgaECCbhb+FHevqoH7eN5jcQAA/nt5VjS5AW5QiJjZc6w9ho2eJopkGiIsSnrclgWME=
X-Gm-Gg: ASbGncuhbCXTNG3iYjXNx6+vTvODBVAqawVgwqW4p5SdvUMlv9MHP6NKyaUi8ygVnZR
	8RbF4044c9CS32qn2FbZhmUB0HhQJSx2zc45hmuvWH29AMLiTH5hoHoowu6etfapZWLfzAZlG8T
	1OO/ubKRjmrYl1S8gYWkYmlp60lFlrHNiwQDtdeO+MFBhMms4+nDIN4+eJnb+zPjq59EWje/60g
	xHuP8wB4M+k1Nz58k/M8h/lGrMUFsNoMjoGszIcafHeP5YPLI6uH0FWvBXYfYA//E4TtSouKLBk
	1E42YZZcf0S3iZjPdZIR9A0641d/2kBdGVBPXh/zMOkaz5bdQOEWu1Pon8DnUcpvP7+i7Rtx8wY
	yD2HT6yfBg40Pvq8CwGDKmtx4BV03q3BQH/Lzwb3KoY3OkriCaKfCYCMkCnCO3Md1D8H6SAV5Ed
	MGB2/YhQ7/up1yDxDQ/ThiYA==
X-Google-Smtp-Source: AGHT+IGb0/G0Y2oVuvPkmvMM5pxw9KWvBDLMoZZ9CrExvWFw6UO+bVtLDy2A3aoJLRHnGzKQeW9qLw==
X-Received: by 2002:a17:906:1795:b0:b70:8afd:7c39 with SMTP id a640c23a62f3a-b708afd8112mr49773766b.57.1761933459716;
        Fri, 31 Oct 2025 10:57:39 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b70779e8f91sm234574266b.33.2025.10.31.10.57.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 10:57:39 -0700 (PDT)
Date: Fri, 31 Oct 2025 18:57:37 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Johan Hovold <johan@kernel.org>
Cc: David Airlie <airlied@linux.ie>, Simona Vetter <simona.vetter@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>
Subject: Re: [GIT PULL] mediatek drm fixes - 20251028
Message-ID: <aQT4kcDnfhK-nTwU@phenom.ffwll.local>
References: <20251028151548.3944-1-chunkuang.hu@kernel.org>
 <aQR2KOvMxghFgQXl@hovoldconsulting.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aQR2KOvMxghFgQXl@hovoldconsulting.com>
X-Operating-System: Linux phenom 6.12.38+deb13-amd64 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_105741_739606_B2C9B174 
X-CRM114-Status: GOOD (  12.47  )
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

On Fri, Oct 31, 2025 at 09:41:12AM +0100, Johan Hovold wrote:
> On Tue, Oct 28, 2025 at 03:15:48PM +0000, Chun-Kuang Hu wrote:
> 
> > ----------------------------------------------------------------
> > Mediatek DRM Fixes - 20251028
> > 
> > 1. Fix device use-after-free on unbind
> > 
> > ----------------------------------------------------------------
> > Johan Hovold (1):
> >       drm/mediatek: Fix device use-after-free on unbind
> 
> Note that this fixes a regression in 6.17-rc4 which have since been
> reported to cause boot failures. The offending commit has also been
> backported to the stable trees so it would be good to get this one into
> 6.18-rc4.

Pulled into drm-fixes, so should make it.

Cheers, Sima
-- 
Simona Vetter
Software Engineer
http://blog.ffwll.ch

