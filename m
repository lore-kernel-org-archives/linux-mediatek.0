Return-Path: <SRS0=VX5C=HD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25254C433DB
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 09:47:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A117864EAA
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Feb 2021 09:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A117864EAA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KyfC4AonHxyQSX213r95J/pjYzvOh6dT9m+qjuo7I4s=; b=jsn4ClvrH3/H8MP3RhE3aJ23p
	E9jrNVpAAZbQUWPcWga8hdEkymHJ3hQmcb+L5iWn/rJV4ufbn2w7XLxdlIB+WCSK2hugYJ5P6FCMN
	DlswqLlpdPbyoCps2jW/NsI+Z4ZnjtdQH0zVB+mwUAl6H6GsfrpJl5Qxli5GULAkjHFcqdouZJnwN
	VNghbjLDvudsxawQR+AeP/oJAKEMD6+E+ko6BaoX56dxTsOK2EjoWICcI3WTSETbkwDnMX9Cbgygz
	l4NPgw677FDfnuvrQzLHAI9kwhwljtyIkRKpYDzUn4/T7o7bjUnOxaV5xWXmDfPfW33cWjwqDN1pR
	XwOCVzPCg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l6Vo3-0001EG-0Z; Mon, 01 Feb 2021 09:47:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l6Vnz-0001Dg-UO; Mon, 01 Feb 2021 09:47:37 +0000
X-UUID: a415812f8f344f9388ed56e81daa1096-20210201
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ZnxN1pLV+rvX9LVEaJLLgeSX4bC8JWZBZLANyFfuHzk=; 
 b=SKsiD2//CU/rGytsU5i0AcICFbv1DBp1mzm42/qoE8Ll4QJVXn/3NkzJKq9vYNDKITfV9HZIMhyhNvsId0m4hyqtM6myxDsjvUD0IrkJxd1T+03QQB1IcCRlaA29ufa5RCp5kt6beFrD378IcAMA/qiL9l+YghA08uQeqEeIpoc=;
X-UUID: a415812f8f344f9388ed56e81daa1096-20210201
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1037934025; Mon, 01 Feb 2021 01:39:59 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Feb 2021 01:31:45 -0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 1 Feb 2021 17:31:43 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 1 Feb 2021 17:31:43 +0800
Message-ID: <1612171903.18201.6.camel@mtksdaap41>
Subject: Re: [PATCH 0/2] Add MediaTek MT8192 clock provider device nodes
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Mon, 1 Feb 2021 17:31:43 +0800
In-Reply-To: <4536e0a3-8e64-d2b0-df83-33705d10359a@gmail.com>
References: <1608644414-17793-1-git-send-email-weiyi.lu@mediatek.com>
 <4536e0a3-8e64-d2b0-df83-33705d10359a@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210201_044736_216254_3B736FE9 
X-CRM114-Status: GOOD (  15.63  )
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
Cc: Rob Herring <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sun, 2021-01-31 at 14:27 +0100, Matthias Brugger wrote:
> 
> On 22/12/2020 14:40, Weiyi Lu wrote:
> > This series is based on v5.10-rc1, MT8192 dts v6[1] and
> > MT8192 clock v6 series[2].
> > 
> > [1] https://patchwork.kernel.org/project/linux-mediatek/list/?series=373899
> > [2] https://patchwork.kernel.org/project/linux-mediatek/list/?series=405295
> > 
> 
> [1] is already mainline. You could add this patch as a new one to [2]. But
> please try to improve the series, before sending just a new version with this
> patch added.
> 
> Regards,
> Matthias
> 
Hi Matthias,

Actually I'm a little confused now. Stephen suggested me to send clock
dts separately because dts may not go through his tree.
So I separated it from the MT8192 clock series since clock v6.
What do you suggest me to do next time?

> > Weiyi Lu (2):
> >   arm64: dts: mediatek: Add mt8192 clock controllers
> >   arm64: dts: mediatek: Correct UART0 bus clock of MT8192
> > 
> >  arch/arm64/boot/dts/mediatek/mt8192.dtsi | 165 ++++++++++++++++++++++-
> >  1 file changed, 164 insertions(+), 1 deletion(-)
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
