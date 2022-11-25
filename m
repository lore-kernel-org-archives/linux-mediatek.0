Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A4BC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Nov 2022 06:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7todQfX6Ph8p4yEF3wKv+qG8KQC8f/WWrCxdxR5F/4=; b=roUmfKkVK4i7+/oHx2K7Yk9tRz
	N21J9yfjpdoWp64/hzBGJHynVO7biKa+yS1Nr2xpcxszl6Rln9nUMT3WLwRsr3jQ3xRPBOaLIW4SQ
	RSs5FjlZAGjS2bswLfx79Sx/6XK8le1oYcndHGsVRoFnp+DrM7dlRXfN8v+cAVTeQiemas/qm52GJ
	kvB0rzbHXWafckgI2DlyqkkBDNlW0gBDx0SnnWD0m37YWonuvVXuE/KyArQcZMhVN7lxAXQGC2kd4
	av+5BY2rw3/LzfGwrdnjASn/ROg9ZhcPNLsSW298ELUkiv8eaNXrqLVmPerREDrRO+0WmOZehSSBg
	1ha6/GSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oySgY-00Ds1Y-KI; Fri, 25 Nov 2022 06:59:42 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oySgV-00Drst-CB; Fri, 25 Nov 2022 06:59:41 +0000
X-UUID: 05846534d0324c2eb52378d6c2666227-20221124
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:Message-ID; bh=v7todQfX6Ph8p4yEF3wKv+qG8KQC8f/WWrCxdxR5F/4=;
	b=FaW3unWrBRFho0t5JnZP41cUHhltosUmWlaD7wPXItIJwzy7D3uTBFGAd4yF2VLjM//jsbfg3oJtD+axvBshthS21fkG0GUR649xT/L2QTSluY8NUJa4HgjbIBN/gvJBOPjVvKycUb68DC+LY4W55FInur0EpEnJSKxxBJB4dyk=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:20a2836b-aaf9-4710-a9ce-84aa57ccd2cb,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:dcaaed0,CLOUDID:28b4cd2f-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:11|1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 05846534d0324c2eb52378d6c2666227-20221124
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <macpaul.lin@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1014770876; Thu, 24 Nov 2022 23:59:22 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 25 Nov 2022 14:58:44 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 25 Nov 2022 14:58:44 +0800
Message-ID: <2ca334b5-292c-bb31-f21e-a25579c6edd7@mediatek.com>
Date: Fri, 25 Nov 2022 14:58:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] usb: host: xhci-mtk: omit shared hcd if either root hub
 has no ports
Content-Language: en-US
To: =?UTF-8?B?Q2h1bmZlbmcgWXVuICjkupHmmKXls7Ap?= <Chunfeng.Yun@mediatek.com>,
	"mathias.nyman@linux.intel.com" <mathias.nyman@linux.intel.com>,
	"mathias.nyman@intel.com" <mathias.nyman@intel.com>
CC: "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "matthias.bgg@gmail.com"
	<matthias.bgg@gmail.com>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>,
	=?UTF-8?B?RWRkaWUgSHVuZyAo5rSq5q2j6ZGrKQ==?= <Eddie.Hung@mediatek.com>,
	"gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ethan Hsieh
	<ethan.hsieh@canonical.com>, Jason Yen <jason.yen@canonical.com>, Bear Wang
	<bear.wang@mediatek.com>, Pablo Sun <pablo.sun@mediatek.com>
References: <20221118110116.20165-1-chunfeng.yun@mediatek.com>
 <a384d15d-c1df-160c-030b-fddd5d965996@linux.intel.com>
 <02552cc60b3aae16b2c2e9717b42c800180e3a87.camel@mediatek.com>
From: Macpaul Lin <macpaul.lin@mediatek.com>
In-Reply-To: <02552cc60b3aae16b2c2e9717b42c800180e3a87.camel@mediatek.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221124_225939_439767_11E84EBD 
X-CRM114-Status: UNSURE (   9.95  )
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



On 11/24/22 18:38, Chunfeng Yun (云春峰) wrote:
> On Wed, 2022-11-23 at 13:10 +0200, Mathias Nyman wrote:
>> On 18.11.2022 13.01, Chunfeng Yun wrote:
>>> There is error log when add a usb3 root hub without ports:
>>> "hub 4-0:1.0: config failed, hub doesn't have any ports! (err -19)"
>>>
>>> so omit the shared hcd if either of the root hubs has no ports, but
>>> usually there is no usb3 port.
>>>
>>> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
>>> ---
>>>    drivers/usb/host/xhci-mtk.c | 72 +++++++++++++++++++++++---------

[deleted...]

Dear Chunfeng,

Since this issue has been reported by Canonical as a ticket
on launchpad (sorry, it has been reported as a private ticket...),
could you please to check if add "Cc: stable@vger.kernel.org" and 
"Fixes:" tags are valid?

If it is possible, please help to list dependent patches to backport
to stable tree also. Is it possible to include this patch in recent LTS 
tree?

Thanks
Macpaul Lin

