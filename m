Return-Path: <SRS0=2fV0=46=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22502C2BB1D
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2020 09:12:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C3E0220746
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Mar 2020 09:12:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ai4gK3K5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R4Eg+CqT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C3E0220746
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hy3kCBucw6+tRwQ9MjD6nw49uS7TtKq9j7pwakkrduU=; b=Ai4gK3K52cKOEx
	gJxpupuGPiiQNvMa618FgQ8m320BrqZqgbPJcEvqMpBGuw1EaW9OfwH3MDUyYAQSJA2C0UwfkHFaJ
	golco/X1vpe3cOhvYgdy6iTtD7v1XdVZwOzM7CmDqAI4ihT6jBd79jlNO0ltVZbZHOD48JJBzT61U
	UP8qORLoZZex3r6S96/7m88TSmry7Xf1VfoXoc7RK1A/3a3m4tq0CkxVx4vbab0UTO4hBw2y4fUG7
	C7QAtXxyY37Z22iCxLt4jTpwVuHLlfKVBkRzwCUtb+vUYpxBlm6IzlakZufub8D2qIyIeTPkF9mYn
	CtV0tBjp2UX1PDmVIxkA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCgMs-0001wt-9T; Fri, 13 Mar 2020 09:12:34 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCgL3-00008K-O4
 for linux-mediatek@lists.infradead.org; Fri, 13 Mar 2020 09:10:43 +0000
Received: by mail-pj1-x1043.google.com with SMTP id u10so3840739pjy.0
 for <linux-mediatek@lists.infradead.org>; Fri, 13 Mar 2020 02:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=JtkM+yZ5+lxvRbR9JLka9INk2b+8sAQT2vc0MdMcdF0=;
 b=R4Eg+CqTJ0CA4+mX+Q0HT1tcnR6NS4q4j5dn6d8VDy7Wz394wQUwvT/NaDJrrFoRkR
 O4/q4o8nR8aYr9LiZjCjS7mE1Zfot+KRD4H1e72uNXjMpENOJ3vSrzA5e/rgHS2aYJt/
 BaKX921yAoqhLuHWhyjVZwWDx6d1rQow8LiWogRoqoq5Ed1jrZ5gmHxTleTjyMQZ8CKs
 T+ypxEPiziHju+YAqbmPXZgW3yTKrcT7Suk/VWNVnzOZBXvpyetDTnzJ6oSWvSHDjPYA
 8QMe+yOkIm+I3kT1Poq2VSQAD5vtvUNRuCXLrRBzA4wiXWN3t1vy/UNExwtyBq89ThAc
 hzzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=JtkM+yZ5+lxvRbR9JLka9INk2b+8sAQT2vc0MdMcdF0=;
 b=bsyVB+ZJ2e2qsV0Uw9/2AlbUyi3MJ5F1N+PKwTw//OhTNRF9vWfGij2ge2rp6xxNn3
 Opg8bW4/wvnnJNghFSuATJYH5EDd89iCKguqYtcrZ+Kdllcv+oTsxe54z6dGjsD3JxJf
 o1K1pKgG2RkvQUrkmR5Ts/SNhe5New1oeYIeRbncaaDAbmFjni6h9MZFBJTIb5OdgLcj
 c3HGRoXdJXEwekMvdLHz1vqn5Mqr+LQwI+jat7aHrIEAYkUBG7122xN2dDW6aSCbYJ6w
 vL9/6ZcoDpd72EhavtA8rYKqYvGDDRuvwkWmtaivtbz168pxbxS7gw/KapYPxZxLTEw3
 Bg5w==
X-Gm-Message-State: ANhLgQ1ioPJ8rZMLXdm2bSrSZgD/sEV/98jKLaTvZbknEZwmQCMi/1IV
 wKTef8zcGO9Rk+IVeQHS7X2hRQ==
X-Google-Smtp-Source: ADFU+vueMkKxf9i4W6oJIJHRrSOEaNDdoKCVYBJIRGmkg6vmX/eRdo6zNqs5xJmNtBnSly4IqRo2Fg==
X-Received: by 2002:a17:902:7485:: with SMTP id
 h5mr11624298pll.13.1584090640801; 
 Fri, 13 Mar 2020 02:10:40 -0700 (PDT)
Received: from localhost ([122.171.122.128])
 by smtp.gmail.com with ESMTPSA id c8sm4233902pfj.108.2020.03.13.02.10.39
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 13 Mar 2020 02:10:39 -0700 (PDT)
Date: Fri, 13 Mar 2020 14:40:38 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "andrew-sh.cheng" <andrew-sh.cheng@mediatek.com>
Subject: Re: [v5, PATCH 4/5] cpufreq: mediatek: add opp notification for SVS
 support
Message-ID: <20200313091038.q7q7exiowoah4nk4@vireshk-i7>
References: <1574769046-28449-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <1574769046-28449-5-git-send-email-andrew-sh.cheng@mediatek.com>
 <20191127083619.etocnhpyyut3hzwq@vireshk-i7>
 <1575874588.13494.4.camel@mtksdaap41>
 <20191210064319.f4ksrxozp3gv4xry@vireshk-i7>
 <1583827865.4840.1.camel@mtksdaap41>
 <20200311060616.62nh7sfwtjwvrjfr@vireshk-i7>
 <1584084154.7753.3.camel@mtksdaap41>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1584084154.7753.3.camel@mtksdaap41>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200313_021041_842530_73453515 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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
Cc: Mark Rutland <mark.rutland@arm.com>, Nishanth Menon <nm@ti.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fan Chen =?utf-8?B?KOmZs+WHoSk=?= <fan.chen@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 13-03-20, 15:22, andrew-sh.cheng wrote:
> I have something want to consult you.
> For your previous comment, you suggest use read-write lock to replace
> mutex lock.
> Will it be more efficiently even when all are write lock?
> (all lock region are "setting VProc voltage")

The data to be protected here isn't the VProc voltage but the list of
valid OPPs. My idea was if we can make the target() routine run a bit
faster as it really matters as it is called from scheduler hot path.

It won't be wrong to use the mutex the way you have used it right now,
but I think the read lock is much faster, though the read/write lock
is more beneficial in case where there are multiple readers and fewer
writers. The target() routine gets called multiple times here, not
in parallel, and the OPP change notifier won't be called so often.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
