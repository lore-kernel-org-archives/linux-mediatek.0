Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC61BC982C1
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2026 01:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dq2fKZpF2ZHXoWdO/QCS/aYMwaYmBqIaG3WsHfdgCQk=; b=LD1NkIkcrlSKNG0lehgZx4cnSt
	SUxcaKI0azT35qZkUzXUzJ2hihsTANwE+O6d3mxsqPL5t1dwWPMGVk4OOkzs468f1YoB3sx69Xob0
	QnItDGsxfhKHbScWYaXVbYfk3dRDbt7K4gaJL0MLVVSz17+TUxahrHvvBDtSurKWwrf8ypxFPyqdA
	OWlxP6lB3BR7ffD+9UIKR4ULjE70vr/gEPejbHT2lfNqx8nPY/pdcx5EaVEcbJ6CcmbqnUj0e11JP
	5tfjPSUR+oIlf9gjcxch+QsKjh26xBEqGCNwX7wpgiGflYNJ80NjBQ503zPEMSBpViLjSqjqLJcoj
	mzJBdnMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x70e0-0000000AOZQ-2dL2;
	Thu, 17 Sep 2026 01:10:32 +0000
Received: from mail-pz2-x0e.google.com ([2607:f8b0:4864:3b::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x70dx-0000000AOXq-1g8l
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Sep 2026 01:10:31 +0000
Received: by mail-pz2-x0e.google.com with SMTP id 41be03b00d2f7-cc50bcf87b2so163839a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 16 Sep 2026 18:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789607428; x=1790212228; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=dq2fKZpF2ZHXoWdO/QCS/aYMwaYmBqIaG3WsHfdgCQk=;
        b=NZMOtfFkqe7J9MALwpuPSepc3I59AYiVg8silMsszfy/fwzyqwO+ThZO/XXdE3g3pH
         XObWh2D6Zg2SqKRXVJRw+MnrAMEtaFOXxAGym2eZoKx7TOQNek5Tclp+Y+FiVKSMU15N
         hnVfAJsVBGc/bP8WQ+IvKmTJPkQZLLRbDZBzATGCJE/1qAXFF6h4xA4MOSUYEjXKf1zt
         /efbYhXo7+ioPILTNFNHqOJ9iY4A4k517ClrFxfGyDp2YGj8I3jm1Jns423lM+VpPKFy
         LNGJnSs2vIAJC8DdYhY7wEjSvp1izX4kj1qciDrj7fPasnl85W/5kebJyIExoSYkRqve
         7qcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789607428; x=1790212228;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dq2fKZpF2ZHXoWdO/QCS/aYMwaYmBqIaG3WsHfdgCQk=;
        b=qQyQIA3f8ELPrN0p+KYTqN8yv6P9n4kfjDHweQ/siXuTggPqTv5L1LyU5BK0LeiuLX
         XI9TxG58R0ecqEm7PAk19EIpL2jxvcnTrUR+LCXZLyW+eScFPqCczmqqgZskstiX80yh
         Z4U30gXprAQ/MIO+8kdRB7DICyLPKHXpql2Hft7HmNW/y75xMRt74pRx/qC7E1XhVkjp
         y8C+/GCvpG657fiIdd/LFHJz8JtFtYXPzfZMOjl9Ix6sF2KNy6AuW1aoh70vp7NlouGa
         ZmlNxkrTdDAINCEEgtwcucrgnaFqTo1i8aVWRGDc4A4wraq/+Afng8e0GA9D6w/rpZtO
         HCIQ==
X-Gm-Message-State: AFuF++l5djdPtahJcaWeFffM6eoLGicAa06ljxXsONeX7biNzY5rXWWf
	gvvVwSDczIGiWOh+f8feDKgmzTrJ8iSQfJ4FciiY60cntJhp1mmPVX+J
X-Gm-Gg: AYBFou0S5T/zdmybqemHN9/T2AL2ccIkU12tzCQuIDadD71AqgGRHVDOLmM5JFjWdNf
	RTEqdSm7vu9Ozba5PZXJkpg0CNGYgO8dlitg9MLpFHtn6+kiV4ZCq+AQ+jXkn5P8hXPjOXIsVhq
	hQo1huSIgi07SzyvkFeTug66xKOeF+mSMwXFs5mK3UjJpGONQteuE786JP48gPNMencTbl+h7QR
	fgTZFgkWU+vty4L8mGUieDWIhwoCVWro1kBg9dD7ic5zGpJCASmAquyCma8ZzMwwXZiSgYpbei8
	qQztC3B9C7B0G7UhfmE2aeqXBnrVNW1YNoShrlpeX9p1NUp0CG4WNmCqVzT7WywCYoobwA6o+sQ
	CrhUaqKORTsirqT+pUrI0LmBLSV6S3U00LKcI+S/mNnjwLD43nLyhFAvQWuZPbdwhDcPKVs5Czc
	B3c9TEx+A4VQgUxPbZ4EmalxcINL5Yl5DSeNbcB91NHI3M3HOP9VQjvwMZ7A6UqinRg809zBXcB
	ET+az41yHo1
X-Received: by 2002:a17:90b:5785:b0:39d:6f12:fd47 with SMTP id 98e67ed59e1d1-39e1e50f73cmr14917254a91.20.1789607428438;
        Wed, 16 Sep 2026 18:10:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3909d02asm353486a91.0.2026.09.16.18.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 18:10:27 -0700 (PDT)
Date: Wed, 16 Sep 2026 18:10:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v5 4/8] watchdog: mediatek: Add support for mt8167
 toprgu/watchdog
Message-ID: <befea2ce-e4a5-4bc0-ba01-d18c4a236667@roeck-us.net>
References: <20260908174259.9009-1-l.scorcia@gmail.com>
 <20260908174259.9009-5-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260908174259.9009-5-l.scorcia@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_181029_444295_DD759E42 
X-CRM114-Status: GOOD (  11.91  )
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

On Tue, Sep 08, 2026 at 07:38:31PM +0200, Luca Leonardo Scorcia wrote:
> Add support for the Top Reset Generation Unit/Watchdog Timer found on
> mt8167.
> 
> Since according to its data sheet mt8167 toprgu reset bits are not
> contiguous, add support for a reset table to the driver. This lets us
> define reset identifiers as contiguous indexes in the binding headers.
> 
> Also address a preexisting Sashiko finding that noticed that the
> has_swsysrst_en configuration was set after the reset controller
> registration.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>

Applied.

Thanks,
Guenter

