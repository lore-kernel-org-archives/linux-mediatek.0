Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CD7C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Mar 2022 13:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:Cc:References:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tcED1cYeQbWQfxRTGKyVkfEuYPVx9FzU4JtUlVLQjC0=; b=BMo2uZj5EybB90
	7A3pUO1X6Hg/XByxSU9JJQaNnZVHF5/zlsRpl92aRvpYIDdUSS2wL+NPedhlF6/kcM5lTKx530du9
	2oV+VCtx+Q9ZB473YKQ5heEKGLr711LJxL9Lje8GstRqQV9keVyv+we+cltnmMHJcauez3iRPH2eN
	6FCkcJkbTvmWJOESgOWQve8ZoDp3CX3t5HRfPNKB34Bhae9o66J963yuDi4I07fHeH74UAdwt9b4w
	eUR3igAXyAlIX0CyCA6TeFvvLnu7c0G11P/ia8p626xcothhKjZbajo9LV49iyGc6Hn8Geikzea9X
	FumPklK5djkhr2r942Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZBmC-00CKd8-Hz; Tue, 29 Mar 2022 13:20:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZBlw-00CKWx-HN; Tue, 29 Mar 2022 13:20:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A50A9B816FB;
 Tue, 29 Mar 2022 13:20:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079B3C2BBE4;
 Tue, 29 Mar 2022 13:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648560029;
 bh=vcBGlG+sqaPt0UpTdoZ2lc9iEFALH1pzWeKYoBtVGc0=;
 h=Date:Subject:To:References:Cc:From:In-Reply-To:From;
 b=Lf6UdkMwpGMKF/bCzH0duecbGSrWXhu70CtFUq2mNv7IsC6370BCiPtfWXaI+yKF/
 UQxjxo/5ELIHPpruCIzbUN34wBvgy5Fc7eS22PnhD5aL+YcFYfFaN/O+tr+ZmUM+S5
 A/HxyRRfNmBU9vHwyfdDK7puvv8H+mPmsnx7QORDs2EqLL+mvW+oCz1joHCa6v9S30
 zZSq7JcFWt8iEt24hFmi80tnq5vNy7tr3oSE2yE/htc0EfUX3gZEr+PbO1Xh/RhzQv
 IsUb015h84Gz6Om/nGHx49iikUSPAbDyLFfT+LjbZl0E6DwqI3AOYIbHwd8W8xbJcf
 NtJzDPqA8j7Dw==
Message-ID: <85eb14ec-f465-7447-ad77-a3dabc666f47@kernel.org>
Date: Tue, 29 Mar 2022 15:20:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Content-Language: en-US
To: Ansuel Smith <ansuelsmth@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-actions@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-omap@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@axis.com,
 linux-aspeed@lists.ozlabs.org, linux-rpi-kernel@lists.infradead.org,
 chrome-platform@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 kernel@dh-electronics.com, linux-mediatek@lists.infradead.org,
 openbmc@lists.ozlabs.org, linux-tegra@vger.kernel.org,
 linux-oxnas@groups.io, linux-arm-msm@vger.kernel.org,
 linux-unisoc@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-realtek-soc@lists.infradead.org
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20220328000915.15041-1-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_062032_891696_E13A23F9 
X-CRM114-Status: GOOD (  38.21  )
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

On 28/03/2022 02:09, Ansuel Smith wrote:
> Hi,
> as the title say, the intention of this ""series"" is to finally categorize
> the ARM dts directory in subdirectory for each oem.
> 
> The main reason for this is that it became unpractical to handle 2600
> dts files and try to even understand/edit/check the situation for a
> specific target.
> 
> In arm64 we already have this kind of separation and I honestly think
> that this was never proposed for ARM due to the fact that there are
> 2600+ files to sort and the fact that it will be a mess to merge this
> entirely but IMHO with a little bit of effort we can finally solve this
> problem and have a well organized directory just like arm64.
> 
> Some prerequisite on how this work was done:
> - This comes entirely from a python script created by me for the task.
>   linked here [1]
> - I had to manually categorize all the different arch in the makefile
>   based on the oem. I searched every arch on the internet trying to
>   understand the correct oem. I hope they are correct but I would love
>   some comments about them.
> - This current ""series"" is all squashed in one big commit to better
>   receive comments for this. The final version ideally would have all
>   changes in separate commits. The script can already do this, it's just
>   commented.
> 
> Here is a list of some discoveries while doing all the sorting.
> These are totally additional reason why we need this.
> 
> While creating the script I discovered some funny things:
> - We have orphan dts! There are dts that are never compiled and are
>   there just for reference. We would never have noticed this without this
>   change and probably nobody noticed it. They are currently all listed
>   in the python script.
> - We have dtsi shared across different oem. My current solution for them
>   is: NOT SORT THEM and leave them in the generic directory and create a
>   link in each oem dts that points to these dtsi. This is to try in
>   every way possible to skip any additional changes to the dts.
>   Current dtsi that suffers from this are only 3. (listed in the script)
> - arm64 dts and dtsi reference ARM dts. Obviously this change would cause
>   broken include for these special dtsi. The script creates a dependency
>   table of the entire arm64 directory and fix every broken dependency
>   (hoping they all use a sane include logic... regex is used to parse
>   all the different dependency)
> 
> So in short the script does the following steps:
> 1. Enumerate all the action to do... (dts to move, scan dependency for
>    the dts...)
> 2. Generate the arm64 dependency
> 3. Creates the Makefile
> 4. Generate the Makefiles for the current oem
> 5. Move all the related dts and dtsi for the current oem
> 6. Check broken dependency and fix them by editing the dts and writing
>    the correct include (or fix any symbolic link)
> 
> This is an output that describes all the things done by the script [2]
> 
> I really hope I didn't commit any logic mistake in the script but most
> of the work should be done.
> 

+Cc Arnd and Olof,

Ansuel,
Thanks for you patch. Please cc the SoC maintainers in such submissions.
It seems that you got some quite nice discussion, but still the core
folks are not Cced, so no one would be able to take your patch...

I am pretty sure we were discussing such split idea in the past and it
did not get traction, but I cannot recall the exact discussion.

To me the idea is good but will cause huge `git am` conflicts.
Cherry-picks, backports and merges should nicely detect path renames,
but git am (and b4 am) I think cannot.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
