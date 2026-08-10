Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F789C5AE49
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Aug 2026 14:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5ax2GIMqI2oJHn6HgwhTWHhHEkIAyr6Rp1OTrqHHWbE=; b=ebYVIYCgEy8fksZ4gKqM/DHOZF
	pYbE6vwJiHfKU9uNQn7SEkpmr48XF8cqxQqwyq+NIEDiiQVL2TYXmZzO+8yiDXcF3b65HSYhtMJv6
	5aAYwuZSQ2GVM8HVmGSUfi8gbU4vNEuiodPBtSV1gug9MtKXkQOLC/3mVTkahC2BuNS7i4QBvy7dD
	0oMjFdHcEOMCgsGkp41ljli3h9Je6hlkiRB+akagBnKvSUPQAlhIoLALQkNh0SofV+M0HsFbkbA95
	mhE/0i/Gi/NcN+KDljXOqWmQJ1z3LL82skoM+TpuqBQ65Etv9x5FdNINvzV4tINzSG7HeQjoPRmtG
	XIoxufBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQve-0000000C08R-3p1f;
	Mon, 10 Aug 2026 14:24:38 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtQvb-0000000C07F-2wnp
	for linux-mediatek@lists.infradead.org;
	Mon, 10 Aug 2026 14:24:36 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-3811f512167so2775090a91.3
        for <linux-mediatek@lists.infradead.org>; Mon, 10 Aug 2026 07:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786371875; x=1786976675; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5ax2GIMqI2oJHn6HgwhTWHhHEkIAyr6Rp1OTrqHHWbE=;
        b=huUKxKx30/IBIMHizw+FVPg4M6+TqXHqiKexrYBVBMqgwlDlB2dMPUCdDlkG1o6tBx
         B/cEh7t7+I0a781uSAHEcA2MA4x0Orw6jxFYGnrIIw9ZqeT1T1u3Ekw3kI2tLrySwVkn
         gnuhgAl9uuF3wTuga3Hw9MxwehVGGxpi1lMadzbQNIU+ynmS7n+mSlqmXWc5iKhUxfIk
         1lLdofUlFKvRedd9462qFjc1Rs1ve2zgqhtwcvWDLFJt5jXu5cOXxYcWkap6t+5LyopU
         nwRnejJ6HYngOdmigFjIRJfDVlazF/4J0KF5Ijal6Qf6w3WkMYwpEWQLZx9/daXmathf
         5i7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786371875; x=1786976675;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5ax2GIMqI2oJHn6HgwhTWHhHEkIAyr6Rp1OTrqHHWbE=;
        b=gtxZaLJ5I4XEfORmBBmBliJh8y8TNxSB0E41DOi5/pGdN30TuXyySBAH1YiMbfrT2i
         qRfaAuIdyhEV4UN1xs2zq8+rJnU2V+Opth4Ud+A5F47f1v0vHjrYTWBJaIxiKZeuxAOo
         kzV+q6176klan7auQQUHl2YC+mRGCnXoL1T5PKxynLAcEyALf+N4vz+VZaK0y79OJT8w
         aPCYvG75rs295souhfpM7DDMyYs2QW8uWuKeewNZI9NgJhbrI56ruE1zSfFIFa0lw2IC
         WeLeB8/R2Vb1BgRxja4m46/2ve+dgXVUN7x7++YDqnB9SuHp5VL9SUPdPMYPRGBlBb1v
         ujNw==
X-Forwarded-Encrypted: i=1; AHgh+Rpe6TsH7tBcN5HagNkr4ddim8ri34ZSAjNCMqMb9zC7hUAbwoD9l7MEG2y80CK+fVIcIke3iL6ehcxIo+x3vA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeE1gnRH7/JKL/JGDih9i/VZMGE5+kvoOlv0RYLjfiWJIvTFQW
	kCrJJgvMwiL1PLu6WsE6g5OL2mi0xme8Uh8J05mT1dQEv1M6mNEQkJS0
X-Gm-Gg: AR+sD11+8g1BzvOVnEgWwLIncXghZQ5KY/WkBQxmVYuAzxyzi9594pJpf7Rdmpryj5M
	8mW7w2NJmIp8hzO5VoWKQeUYqQWu4Z1u7Xf62Gw4L1m2jfk/JF0b5RbDtGJIbRP8RFjaMYjV2rp
	Iu0EKppbX9kbmOVbg58UpGzYZarjFYpS4LOkn0dJKJA2YD49bBEF5aPzxPVnpEHq/FvQfMMKC7A
	KxSZrMvH7XiIxcsxkViFCYUO/kChjZRx2CIuQJ8qOcRQgaqMPhnetUjVAz/pfvndKXkbi458Zri
	n7sy67fUSonlALaByA7iumwLrqdRCur+qL/4dq8YCRlKkXFARuZmCdgMzWFmzEj2iviDm+FHVNs
	ZJv/aVrXMg+ytmbn+f94FXCLMwwxpYn2NDxurKnBfDGb0d2oo95xrtExhqxLhw3Jbs04QpD+1qm
	i3XoY2H7ikgwk+2h0KXRtjiGBq03+49XXL1uCJY0fpyUJEGkHzRPsUnpdGIfmoCZdGTJIlGo5ub
	A==
X-Received: by 2002:a05:6a21:7308:b0:3c3:a1e6:a626 with SMTP id adf61e73a8af0-3cc1a3f1658mr2809036637.32.1786371874643;
        Mon, 10 Aug 2026 07:24:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86d3d1sm46551457eec.2.2026.08.10.07.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Aug 2026 07:24:33 -0700 (PDT)
Date: Mon, 10 Aug 2026 07:24:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Bui Duc Phuc <phucduc.bui@gmail.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-msm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/4] watchdog: aspeed: Propagate errors from optional IRQ
 lookup
Message-ID: <01283c69-d5ca-42b0-a75d-6ebb07fee46a@roeck-us.net>
References: <20260807081652.38692-1-phucduc.bui@gmail.com>
 <20260807081652.38692-4-phucduc.bui@gmail.com>
 <1f26fc28-da13-4ca3-990f-676b53d23630@roeck-us.net>
 <CAABR9nFy=GD4afdDxzsbp31Sq=smGVFf+HvqsrJKh_FjqdUrJA@mail.gmail.com>
 <3a9b7b85-e6f8-429a-91df-f674479dee58@roeck-us.net>
 <CAABR9nFcitFyS_xZUkreHWp822iVsoEg6ONFwU9JwPaBqm2MTQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAABR9nFcitFyS_xZUkreHWp822iVsoEg6ONFwU9JwPaBqm2MTQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_072435_744938_AD5F9882 
X-CRM114-Status: GOOD (  19.39  )
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

On Mon, Aug 10, 2026 at 04:45:07PM +0700, Bui Duc Phuc wrote:
> Hi Guenter,
> 
> 
> Thank you for your feedback.
> 
> > >>> +                     return irq;
> > >>>                if (irq > 0) {
> > >>
> > >> This if () is no longer needed.
> > >>
> > >
> > > If we remove the if (irq > 0) check, irq can be -ENXIO and would be
> > > passed to devm_request_irq().
> > > I see that the irq argument of devm_request_irq() is an unsigned int.
> > > Would it be safe to pass -ENXIO to it in this case?
> > >
> > No, sorry, I was wrong.
> >
> 
> So this means there are no issues with this patch.
> Patches 2 and 3 have already been applied by you.
> I will temporarily resend only patch 1:
> " watchdog: qcom: Propagate errors from optional IRQ lookup "
> 
Correct. Note that gmail may swallow this reply, claiming that it is spam.

Guenter

