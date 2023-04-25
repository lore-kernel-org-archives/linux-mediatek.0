Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9324FC77B61
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Apr 2023 16:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=518NqRonnFHD2DxxKO+SEaWfT76uscNDaew1RMNKyb8=; b=Pu7pZtonbWC3K+9QEojDBxsZqg
	2cNT4jTcpKEzkyHaBbXJ3E2gLnIUwQyrAyLSb9b/gLxPWfLVYfJoH7T8yeV4iOzX3VqbaX7+ju6Z1
	1Wt8YsnDnkInNrKrE8DZ0dsPUdKxDXs0PC0fN6pG0ShxeS8IPRSYM7mdlF6ou2rN7B0xa8/Bkaca+
	zB7MAprim3mV/WGsP2AQDpxkx3jvVs+BPQJJ8blS11HdmqRlvC9EhDhng6m7CSZYlzequTZy1zxfT
	lT52Im1Ii7lZ3r3uaSuQf5RxAuocth0yXJCDGiysL91JVqfsOgS5OY/y49fj1C2ZAbnHpFKTlcfJ5
	o8auCVBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prLQF-001efZ-2V;
	Tue, 25 Apr 2023 16:21:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prLQB-001ee5-05;
	Tue, 25 Apr 2023 16:21:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E2F24B3;
	Tue, 25 Apr 2023 09:22:19 -0700 (PDT)
Received: from [10.1.196.40] (e121345-lin.cambridge.arm.com [10.1.196.40])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CD31A3F587;
	Tue, 25 Apr 2023 09:21:31 -0700 (PDT)
Message-ID: <45bc13a8-1442-2dd3-b9ea-1ed2f5962bac@arm.com>
Date: Tue, 25 Apr 2023 17:21:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux aarch64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC PATCH 0/1] Categorize ARM dts directory
Content-Language: en-GB
To: Nicolas Ferre <nicolas.ferre@microchip.com>,
 Daniel Palmer <daniel@0x0f.com>, Ansuel Smith <ansuelsmth@gmail.com>,
 Claudiu Beznea <Claudiu.Beznea@microchip.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Santiago Esteban <Santiago.Esteban@microchip.com>,
 Cristian Birsan <Cristian.Birsan@microchip.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, DTML <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-actions@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-omap@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@axis.com, linux-aspeed@lists.ozlabs.org,
 linux-rpi-kernel@lists.infradead.org, chrome-platform@lists.linux.dev,
 linux-renesas-soc@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, kernel@dh-electronics.com,
 linux-mediatek@lists.infradead.org, openbmc@lists.ozlabs.org,
 linux-tegra@vger.kernel.org, linux-oxnas@groups.io,
 linux-arm-msm@vger.kernel.org, linux-unisoc@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-realtek-soc@lists.infradead.org
References: <20220328000915.15041-1-ansuelsmth@gmail.com>
 <CAFr9PXkgrRe-=E=GhNnZ4w1x_FMb97-_RmX6ND1vEd74_TbZSw@mail.gmail.com>
 <4ff4f171-c5f8-87af-aad1-5e7686292288@microchip.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <4ff4f171-c5f8-87af-aad1-5e7686292288@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230425_092139_154069_6B07F70F 
X-CRM114-Status: GOOD (  23.15  )
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

On 29/03/2022 9:50 am, Nicolas Ferre wrote:
> Ansuel, All,
> 
> On 28/03/2022 at 10:55, Daniel Palmer wrote:
>> Hi Ansuel
>>
>> On Mon, 28 Mar 2022 at 09:09, Ansuel Smith <ansuelsmth@gmail.com> wrote:
>>>
>>> Hi,
>>> as the title say, the intention of this ""series"" is to finally 
>>> categorize
>>> the ARM dts directory in subdirectory for each oem.
>>
>> While I agree with this change and think it's for the good (browsing
>> the ARM dts directory at the moment is frustrating..) I think
>> buildroot and others need to be told about this as it'll potentially
>> break their kernel build scripting for ARM and probably messes up the
>> configs they have for existing boards.
> 
> This aspect mustn't be underestimated and I anticipate lots of issues 
> during a long time on this particular topic of "build systems".
> 
> Another aspect is CI and public or private testing farms we all have 
> running.

Yet another is if this affects what `make dtbs_install` does (I don't 
know for sure, but I'd be inclined to suspect it might). Some distros 
use that to deliver the DTBs as part of their kernel package, so if 
paths suddenly change it could break end users' bootloader setups too.

Thanks,
Robin.

> These aspects always refrained me to change anything in the naming 
> scheme of our DT files, but if we go in this direction, we must really 
> be prepared and I'm still not convince it's worth it...
> 
> 
> If this has to happen, I would also like to queue some file name changes 
> to do all modifications in one go in order to lower the annoyance level 
> of those who would need to adapt to those changes.
> 
> BTW, is there a common scheme for dts/dtsi file naming? Is it more 
> enforced in one way or another for arm64 in a sense that I can take some 
> norm as an example?
> 
> [..]
> 
> Best regards,
>    Nicolas
> 
> 
> 

