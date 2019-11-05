Return-Path: <SRS0=3chi=Y5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70DF1CA9ED0
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2019 06:56:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 40706214B2
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Nov 2019 06:56:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Kh68BaiT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sYLkh9eJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 40706214B2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t/zy4DAZB6+dVtebEn+trNe67YQgebcuYv8nBJEsni8=; b=Kh68BaiTGxz+mw
	C3NU9w/azH39tTgBHuAl/CdI3RAt9mykhmPsbDoj7SgDbgVpW7s8ZXh1koFHbRLKq/Qfts3Q0cRAB
	2R3eVS3Pt2jPdHEeYR1FHpXH7UyFRB4BCTuuEcoGHKHM9WwoSxLUBMZrpV3uZe7LqrfFMyjLMhy+W
	dXXqAfIA5+tgVpzZ2Z0hDfnE5O7sqdX6XDOkxsQWr2ohZNP59FNvzXxEB7Nlohq3E5zkA/uUqQxeq
	WiIbrsjHmxmSzxqtmYn+988QbFet6h/Px5FKIB3It2/RKgVQNfRhQyN9qclGRLd1kQeT19e4AtvE9
	Aoc8xLGdqs4TJrYTF46Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iRslU-0006qV-R8; Tue, 05 Nov 2019 06:56:32 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iRslR-0006p3-Eh
 for linux-mediatek@lists.infradead.org; Tue, 05 Nov 2019 06:56:31 +0000
Received: by mail-pg1-x544.google.com with SMTP id w11so3005069pga.12
 for <linux-mediatek@lists.infradead.org>; Mon, 04 Nov 2019 22:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ov53IhqY+y2u5I+jv06ZVDSheZi0X6lfhJFxD0jJ1jY=;
 b=sYLkh9eJyOp3PyVAMRShFJBgV1u3OrLWHhznBG/lzdcqiGFWBpMogdewuNIZ3W3Aya
 ypLA2lOiSwS7Mha8F74R9we2LjzymNASflKZGpVmyMj53Piod7y5wFvSaOEFK8NTIqzX
 e98lI5w7K8FqOpp1Po8LPB+KCLElA32LZ59m8Q9kj09uLtL6/pZDGNms0qOh+stWZvZ7
 50KtkyGhiw2X9OTLkgY/wnVfuHo6DXt34Be2bWVmGsnb5BajtNdRyIo+awmobq0fbO6m
 /576r3DcKQV0OAk9cEOOfxTloL5WzxdlqLvM5aZ0rI5paZdh8hZIR4yK1bv1JeuiL5VE
 nllQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ov53IhqY+y2u5I+jv06ZVDSheZi0X6lfhJFxD0jJ1jY=;
 b=s2seDG5B4GmMBYh4tAvDhXA3yOwagKULjOgRUFKjn1ZaSKmvXVvfrBaUET4Rturvhc
 eejsWJd0O9qfIZwfGClxomOelbyaoyHNuQMRpZSvCqFfaQwt33ewfsqRefQP9FhtA0I8
 Dl4ZO4mThb7pMVJH/g1ev6pD3hvLtg3IJrMe5XfKL6NJvj/0G6SKKf8VPjncIFwSrypM
 ZAonw38sb3UWoA5Zx9Cta6+AvHnK3i5zVxR+WJapJ1vxENlSRibKodENPdEq0+7ldZNh
 FFqnnEs2kOB3gvbhZ5N3gO7/V+TA7yZb19Bn7fdh0RwoqcI6obF+yRX2JpImgsqjE31V
 5soQ==
X-Gm-Message-State: APjAAAU4o2HHsLqFPND+UZgQUj46BxOz+6w70/S6VzrUXfjZ3Q8gbCYQ
 2fWBOcy79nYcxWSRV/VR/ABhNg==
X-Google-Smtp-Source: APXvYqziJLDh7KltXxceWTUbGJJMReFbby2FRl5eOFtHFG7ihNZWZjPXD1U+iFBCnM+RPj2q5kPBAw==
X-Received: by 2002:a62:61c4:: with SMTP id v187mr35889736pfb.23.1572936988079; 
 Mon, 04 Nov 2019 22:56:28 -0800 (PST)
Received: from localhost ([122.171.110.253])
 by smtp.gmail.com with ESMTPSA id y16sm19426905pfo.62.2019.11.04.22.56.26
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 04 Nov 2019 22:56:27 -0800 (PST)
Date: Tue, 5 Nov 2019 12:26:21 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Roger Lu <roger.lu@mediatek.com>
Subject: Re: [v4, 6/8] PM / OPP: Support adjusting OPP voltages at runtime
Message-ID: <20191105065621.iq6lp74tydrneshk@vireshk-i7>
References: <1565703113-31479-1-git-send-email-andrew-sh.cheng@mediatek.com>
 <1565703113-31479-7-git-send-email-andrew-sh.cheng@mediatek.com>
 <20190819111836.5cu245xre6ky6xav@vireshk-i7>
 <1572595738.6939.7.camel@mtksdaap41>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1572595738.6939.7.camel@mtksdaap41>
User-Agent: NeoMutt/20180716-391-311a52
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191104_225629_529241_1386E44E 
X-CRM114-Status: GOOD (  10.19  )
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
 Andrew-sh Cheng =?utf-8?B?KOmEreW8j+WLsyk=?=
 <andrew-sh.cheng@mediatek.com>, srv_heupstream <srv_heupstream@mediatek.com>,
 "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, Stephen Boyd <sboyd@codeaurora.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Chanwoo Choi <cw00.choi@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fan Chen =?utf-8?B?KOmZs+WHoSk=?= <fan.chen@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 01-11-19, 16:08, Roger Lu wrote:
> I've studied opp/core.c and still don't know meaning of triplet here.
> Could you give me more hints (reference API?) about how to take a
> triplet instead? Thanks in advance.

I was hoping you to follow this thread :)

https://lore.kernel.org/linux-arm-kernel/20191016145756.16004-2-s.nawrocki@samsung.com/

I already applied this patch to the OPP tree.

-- 
viresh

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
