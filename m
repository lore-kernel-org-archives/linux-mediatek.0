Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91891C83F01
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Aug 2023 02:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:Cc:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGQlGA42OfpEumVzukXZZfn8QZhOFGf5WCP9g2PH91s=; b=wwz435xq+rOMYaXpwJKbXzb15r
	aZfWYxuh3kph9UvmJazJJHRxWL6ph9hBBI5l2oHQyh4EoAH8Wjv3PnH0kPjsTueF150+pFUdj9/z0
	4ikRJR2aT6AWa64cXWiXtsG/cgTFtcK2+ec8C5+1sx2IUaQfT7fY9crFGD5L5DqxE2Y+e5gUzP8fp
	tE3ls9Mc0CjaJMvy9ChD0f4LXAhD+b9L4vzURJiJyKvI9t3QUIdcqMnpgPDKMarMYk2T6b+9dbOn1
	3mPnPumPyUtdbXP+TRaQWu2BHamikU4mk4csHT2Pg7mZWRV+N/S+AyRDcW116WyVIgaAAACt1Pumv
	ScRlX6DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaRzS-008k5p-0R;
	Mon, 28 Aug 2023 02:28:30 +0000
Received: from mail-m11880.qiye.163.com ([115.236.118.80])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaRzO-008k5G-2q;
	Mon, 28 Aug 2023 02:28:28 +0000
Received: from [172.16.12.69] (unknown [58.22.7.114])
	by mail-m11880.qiye.163.com (Hmail) with ESMTPA id 5C8D620881;
	Mon, 28 Aug 2023 10:27:34 +0800 (CST)
Message-ID: <95e9525e-3101-4433-27e2-cd69f254af1c@rock-chips.com>
Date: Mon, 28 Aug 2023 10:27:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Cc: shawn.lin@rock-chips.com, angelogioacchino.delregno@collabora.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
 matthias.bgg@gmail.com, ulf.hansson@linaro.org, wsd_upstream@mediatek.com
Subject: Re: [PATCH 1/1] mmc: Set optimal I/O size when mmc_setip_queue
Content-Language: en-GB
To: Sharp.Xia@mediatek.com
References: <769a67cb-1b32-fd4f-b37e-e3ec4dab5eb9@rock-chips.com>
 <20230826162635.617-1-Sharp.Xia@mediatek.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
In-Reply-To: <20230826162635.617-1-Sharp.Xia@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0pISVZLSkkfGhoaQkxJTx5VEwETFh
	oSFyQUDg9ZV1kYEgtZQVlOQ1VJSVVMVUpKT1lXWRYaDxIVHRRZQVlPS0hVSk1PSU5IVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a8a39f7c8492eb6kusn5c8d620881
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Pj46HDo5HT1DDTMcDDY8Eioo
	KU5PCwlVSlVKTUJISkNCTU5OS01PVTMWGhIXVQgTGgwVVRcSFTsJFBgQVhgTEgsIVRgUFkVZV1kS
	C1lBWU5DVUlJVUxVSkpPWVdZCAFZQUhJTUk3Bg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230827_192827_075209_C05EFEED 
X-CRM114-Status: UNSURE (   9.06  )
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

Hi Sharp

On 2023/8/27 0:26, Sharp.Xia@mediatek.com wrote:
> On Fri, 2023-08-25 at 17:17 +0800, Shawn Lin wrote:
>>   	
>>

After more testing, most of my platforms which runs at HS400/HS200 mode 
shows nearly no differences with the readahead ranging from 128 to 1024. 
Yet just a board shows a performance drop now. Highly suspect it's eMMC
chip depends. I would recommand leave it to the BSP guys to decide which
readahead value is best for their usage.

> 
> I tested with RK3568 and sdhci-of-dwcmshc.c driver, the performance improved by 2~3%.
>   
> Before:
> root@OpenWrt:/mnt/mmcblk0p3# time dd if=test.img of=/dev/null
> 2097152+0 records in
> 2097152+0 records out
> real    0m 6.01s
> user    0m 0.84s
> sys     0m 2.89s
> root@OpenWrt:/mnt/mmcblk0p3# cat /sys/block/mmcblk0/queue/read_ahead_kb
> 128
>   
> After:
> root@OpenWrt:/mnt/mmcblk0p3# echo 3 > /proc/sys/vm/drop_caches
> root@OpenWrt:/mnt/mmcblk0p3# time dd if=test.img of=/dev/null
> 2097152+0 records in
> 2097152+0 records out
> real    0m 5.86s
> user    0m 1.04s
> sys     0m 3.18s
> root@OpenWrt:/mnt/mmcblk0p3# cat /sys/block/mmcblk0/queue/read_ahead_kb
> 1024
>   
> root@OpenWrt:/sys/kernel/debug/mmc0# cat ios
> clock:          200000000 Hz
> actual clock:   200000000 Hz
> vdd:            18 (3.0 ~ 3.1 V)
> bus mode:       2 (push-pull)
> chip select:    0 (don't care)
> power mode:     2 (on)
> bus width:      3 (8 bits)
> timing spec:    9 (mmc HS200)
> signal voltage: 1 (1.80 V)
> driver type:    0 (driver type B)
> 

