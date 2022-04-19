Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD920C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Apr 2022 18:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PDlH3jkZUoxzbQi+svK+aybe+VvO82oELUvPN4DbGOU=; b=glP1J74yam82JX
	WtDVZJPX85RalFNSlmGGVRM7iixadV89h1Ux1gkO1QFwsDOMu9w1j73CFnBSIAjHeYg7gNTqUMJVT
	I1YAzd9UCZ1PfKuLSGvTeGflORM6p/wcvNMC28jHt6OkWhIT01SKc4afe1I4jgN3wH+v5KUZqz0ED
	RyXIBZuqUb5FlvB3uHLBOBhLCNcjfy4XnM3dhzAyiVmvkZxUWsNAr01XMLbOGZa2TKZOmJD4txeQf
	U4V/q/G0J1Cr8nmOlA3Jh9QXpM54P+z4sD8MBiR9hizNzwQWRiDWJvXXXEFv4iP+gzrBdpWjhMRVP
	qlIfvJXfydo89ygdPmOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ngscL-005ggS-AM; Tue, 19 Apr 2022 18:30:25 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ngsP2-005Zut-0y
 for linux-mediatek@lists.infradead.org; Tue, 19 Apr 2022 18:16:43 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 i24-20020a17090adc1800b001cd5529465aso2665258pjv.0
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Apr 2022 11:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=AjgDpPskVV4R4Ry4hrbWpc/9hMmAwQ0eTwMouf2MnOU=;
 b=bMihXYjxDYd70FBAdkcUWSX+XlWzIAfBgJnYw0igXRFV+04YT4oMj+OjOTM2ojX4W9
 GYMwFCZU1Xdt5BZHTbv+NmWWboVjFsrVaTtRXcXquMXtE2er7IqkVjMBBOBs6ZFROx1K
 cN5J3DB05qfDIzqnwP5O1+1DPUaGJQV6AyBLoyiOLvRbNcSQS3QiiYDnqLdgWGiDUCUS
 W5r14jEvv37KT53Roabxlk4ixJo7v1FMya2s0VY9D1HEtwlz3DsNCHsPx7u9jekYBzVs
 hZwkblG+Dl9GnFGir7Sr1y2O6tI5+nKUgBTdUrkm20VgY0lwgfwLyq59kXH5GSoVK05+
 ItnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=AjgDpPskVV4R4Ry4hrbWpc/9hMmAwQ0eTwMouf2MnOU=;
 b=q+9Uy9hZvc02cOavHzvkHfQ+BoigfamjSkkTzsmxe4aimAb28e3vnwPFL3t6pCpKVR
 K7nGrxtPdg2hnPaHbE+oqU++8jaCMh/+EuiDoRWXTO+86el4K8QeLEFdPHcW9AoDwWfJ
 nxkS03+4lubHNW/ndI/fXzQUFJFdmCZR6t4o/AI72bXZ8pA6ZgFBD44PxQ7PKYT26l3h
 7iJAZouJUbGd0y04OClgJb+3Sz23+i80GyQ6OUIM859Y9STpfkTNehVErq6LOiS/dGnB
 tLFpR6BE6qUz1Eef8+2Cwf2+4DITQTyMEwDfkYkJ+y9YCE3CRXmpBKbUssSVmEV7RiAt
 BD+w==
X-Gm-Message-State: AOAM532ATWv0busv0Lw6T4MDFDcQ5PoiO08osTeitz5eaLVl82JKpJ8i
 bgsLXp72t1vFeNG0W9lHKTLfeQ==
X-Google-Smtp-Source: ABdhPJzob3GzCfSoCXKRmPqceM7UO6pOMBdQF/W+KIIoJ8hpD8bUMg3PD/l5kz2paua0Q592Ix7PwA==
X-Received: by 2002:a17:902:bb94:b0:157:2ce:fac1 with SMTP id
 m20-20020a170902bb9400b0015702cefac1mr16955546pls.25.1650392196359; 
 Tue, 19 Apr 2022 11:16:36 -0700 (PDT)
Received: from localhost (c-71-197-186-152.hsd1.wa.comcast.net.
 [71.197.186.152]) by smtp.gmail.com with ESMTPSA id
 g12-20020a056a001a0c00b004e1307b249csm18036219pfv.69.2022.04.19.11.16.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 11:16:35 -0700 (PDT)
From: Kevin Hilman <khilman@baylibre.com>
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH V2 13/15] cpufreq: mediatek: Link CCI device to CPU
In-Reply-To: <3fc36d6b803ff3e1bef601839aaca3f4f03e62ad.camel@mediatek.com>
References: <7hbkx3fiac.fsf@baylibre.com>
 <3fc36d6b803ff3e1bef601839aaca3f4f03e62ad.camel@mediatek.com>
Date: Tue, 19 Apr 2022 11:16:35 -0700
Message-ID: <7hwnfldjlo.fsf@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220419_111640_242489_4129CA4E 
X-CRM114-Status: GOOD (  23.57  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Rex-BC Chen <rex-bc.chen@mediatek.com> writes:

> On Thu, 2022-04-14 at 14:48 -0700, Kevin Hilman wrote:

[...]

>> 
>> You explained this well, but it's still not an appropriate solution
>> IMO,
>> because you're still not setting the target that is requested by the
>> CPUfreq core.
>> 
>> The job of ->set_target() is to set the frequency *requested by
>> CPUfreq
>> core*.  If you cannot do that, you should return failure.  What you
>> posted
>> in the original patch and what you're proposing here is to ignore the
>> frequency passed to ->set_target() and do something else.  In the
>> orignal patch, you propose do to nothing.  Now, you're ignoring the 
>> target passed in and setting something else.  In both cases, the
>> CPUfreq
>> core things you have successfuly set the frequency requested, but you
>> have not.  This means there's a mismatch between what the CPUfreq
>> core &
>> governer things the frequency is and what is actually set.  *This* is
>> the part that I think is wrong.
>> 
>> Instead, the proper way of restricting available frequencies is to
>> use
>> governors or policies.  This ensures that the core & governors are
>> aligned with what the platform driver actually does.
>> 
>> As I proposed earlier, I think a clean solution to this problem is to
>> create a temporary policy at probe time that restricts the available
>> OPPs based on what the current CCI freq/voltage are.  Once CCI driver
>> is
>> loaded and working, this policy can be removed.
>> 
>> Kevin
>> 
>> 
>
> Hello Kevin,
>
> In new proposal, we DO set the cpufreq passed by cpufreq core.
> We just not set the corresponding voltage of target frequency which
> is lookedup from opp table.

OK, this makes more sense.  I thought you were ignoring frequency change
also.

[...]

> In summary, we think it's a proper solution to cover the situation
> when cci is not probed.

Yes, this is OK with me.

> I think there is something to improve:
> We can choose to lookup cci opp table using cci freq to determine
> the voltage instead of voltage_on_boot.
> But IMO, it's not neccessary to register cci opp table inside cpufreq
> driver just for the short period.

I agree.

> Because I finish to prepare other patches and I think we also can
> take a look at other patches which are including some cleanup, I will
> send next version today.
> If there is any concern and question, we can discuss in next version.

OK, I'll have a closer look at the new version.

Kevin


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
