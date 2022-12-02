Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0FEBC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Dec 2022 05:27:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSxc/vuw8b8ZlV/zQQB1AHYxMkA7FyAjq/UT8DAx5EM=; b=3CkFcT/mkv+ljkba2jcGL6X2cH
	ZRBe7z4LQRjRKv9PUNjetig7YEqwXPavEXpgD/menFE7oevUD6ARChLT/mAQPGhQAWHszHfekqFnl
	XdVX54gEv9mzMK2pCFbGx8gsIJpo9ecQcxD56sqalEM34lon/CMZNsn1pGmgnoHHWZr1Vitol9uT1
	pmmDdzilIabY0x4bTWxnAXS9VBd5dPwz2mzmhNWd++eWQ2slcT72TtDIBoWk8SuAk+XA2Iui/dq6z
	7ci5bIOTZVn1n0kOsCWlej+GqAKhPbgIUknFPUj+djE3Edm7n2/KU0aI37gjqeR+t/DZgOkJMi5sv
	7CRfU4DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0yaC-00DVWl-VK; Fri, 02 Dec 2022 05:27:32 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ya7-00DVS0-04
	for linux-mediatek@lists.infradead.org; Fri, 02 Dec 2022 05:27:28 +0000
Received: by mail-pj1-x1033.google.com with SMTP id cm20so3929321pjb.1
        for <linux-mediatek@lists.infradead.org>; Thu, 01 Dec 2022 21:27:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eSxc/vuw8b8ZlV/zQQB1AHYxMkA7FyAjq/UT8DAx5EM=;
        b=JxjJFek7AAPKxa74aAl5FtksMKDZBRv8UpjC6oDgN8cTcnEoLw1Ea1XvcpICJmfCP/
         B0u5qpGMP6zAnvqu4HscpVX9p3enKr5Ji9GaHQV1SvFteYNQIcjkhB4jZ4jZTaPg6Zu+
         5pMLjpVs2ZOskNgLywnTUs5/YKE964gxJSTMstdhauLcD9QjTTYVDenmBEjTC+k4XgNe
         PTFuOJt+wifphpsprqfu42xfYcMzG9jSudpYrHsfdu0rvxrfvUHJf8V3yJP9BLdW7hJb
         0zm9U5Rzsdc+BjbzYcj2mISlYjxGzgzWFYZGzYcBasXnskxBtAJSbsqztCRjO9MN2VD7
         OUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eSxc/vuw8b8ZlV/zQQB1AHYxMkA7FyAjq/UT8DAx5EM=;
        b=mSLpJcDYpewL/kHnGtDJorOce38pTh8uY2t/KaRS44XNCVIdy5cX8K0Su7g16QcAqy
         WjLGrdTPL6dg1WG0lKQlecEYQ7A7Ovo++5+xYzQHmA/W67q+2By984DBrPgp7Zi4Sl5/
         363ddch3tfPlkWuKxM+GEWy7aU3uiatIlNg2SlWr4topNmcapVOKeP/8iwMpRt0/8Gom
         ZtowKFWmFqkmBO32OyVTbeANv5Q85RYO6hvgkKAJ4c3hXK3NJgCkMXvxTHtZl4NmvqKa
         3/dG3PsGbqlBwe1uNm26Jv78571VWbMT3V8hTshsofSRd6FbGHLTheHccps6iNUc0OlS
         2KLQ==
X-Gm-Message-State: ANoB5pn6GWshdPanssim3l5PcTnrOQbYN9h0k4Ww0kYJ3F7c93667aXG
	onmdlZGfVv2wBvNtDhYiPNoMpA==
X-Google-Smtp-Source: AA0mqf4qhJ72iEB1qNdRF4ONDN4xQ7Tu4gAgw2SXdas1iORjFhdOikJ95Q7LaqhRV0EwhSaiwVYZHg==
X-Received: by 2002:a17:90a:5991:b0:218:47f1:b47b with SMTP id l17-20020a17090a599100b0021847f1b47bmr73243982pji.201.1669958839315;
        Thu, 01 Dec 2022 21:27:19 -0800 (PST)
Received: from localhost ([122.172.87.149])
        by smtp.gmail.com with ESMTPSA id b65-20020a62cf44000000b0056f0753390csm4273317pfg.96.2022.12.01.21.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 21:27:18 -0800 (PST)
Date: Fri, 2 Dec 2022 10:57:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Thorsten Leemhuis <regressions@leemhuis.info>
Subject: Re: Kernel Kernel bug caused by (cpufreq: mediatek: Refine
 mtk_cpufreq_voltage_tracking()) on Banana Pi R64 (MT7622)
Message-ID: <20221202052716.uj3kzkunazmgazeq@vireshk-i7>
References: <930778a1-5e8b-6df6-3276-42dcdadaf682@systemli.org>
 <eb142a22-b35e-ec3f-ee0a-9e3e7b24cea6@gmail.com>
 <bf8d2a8f-7654-29be-1104-a842c6657b5e@systemli.org>
 <02c2c955-940b-b315-0474-85d0eddad7a3@leemhuis.info>
 <Y4jHvomTrU8guBox@makrotopia.org>
 <47a4665e-333d-a6e7-a2da-96cb06c2d87b@leemhuis.info>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47a4665e-333d-a6e7-a2da-96cb06c2d87b@leemhuis.info>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_212727_050485_72D0700A 
X-CRM114-Status: UNSURE (   9.04  )
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
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, Nick <vincent@systemli.org>, linux-pm@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, "regressions@lists.linux.dev" <regressions@lists.linux.dev>, rex-bc.chen@mediatek.com, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, =?utf-8?B?SMO8aG4s?= Thomas <thomas.huehn@hs-nordhausen.de>, jia-wei.chang@mediatek.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 01-12-22, 16:39, Thorsten Leemhuis wrote:
> Thx for clarifying. And I noticed I made a mistake: I should have
> directed my earlier question wrt to any progress here more into the
> direction of Jia-Wei Chang (who authored 6a17b3876b) and Viresh Kumar
> (who committed it).

I was waiting for the platform maintainers to come up with a fix. I
have sent a patch now to revert this, in-reply-to this thread.

Please confirm this is working fine. Thanks.

-- 
viresh

