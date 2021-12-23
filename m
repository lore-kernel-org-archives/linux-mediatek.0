Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08AB4C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Dec 2021 11:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ScwdCARFBZ8GQMl1jjXTQbKTFPIPSZXPF5L35Vz8bqA=; b=Q0SYPMjsBxUSi1
	oZZWPjakAGcpRdAPYLshLaf/TR/GKcnrmOIGcEkDLtFvvsiBbF64mk3LqNdcg4urEy8HaJbkZQGAJ
	PEoOLp87zQybwKLanZYu/eDR6VOLvhaveyn+ikgN1z34JGzG3KQJdTeey8QEBmJDJMiaAY0p6g5p3
	R+jHB8PQDCL/MalRKk5c8XifyO0jZMykhVNNCQevSLuM9n6oy/W+/2kJtR7tFOLuq0pnONMwrQKb/
	oAnHqNfTwUs6hQ4br1JyJY1OBYbAOexqqg8QgDwLwgEgCvZE0V+l9bQI+gIsyDJIfKhUsDFVlDLG+
	SjtD15ArD6tQeOywvsnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0MQH-00CbB4-Js; Thu, 23 Dec 2021 11:38:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0MQ5-00Cb9F-Ug; Thu, 23 Dec 2021 11:38:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 637FE61E53;
 Thu, 23 Dec 2021 11:38:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C229C36AE9;
 Thu, 23 Dec 2021 11:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640259480;
 bh=YYQsw46HbqBIVqWYtDAxAXVzo5ClBLP5gwEBXoLLurw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ErzEqKVvqcikkIp7Y1Fc3WaKLzAmRDXNyvfWrfe+KBcMtJqfvDe2tE/8EMq4G19/J
 wuNGWFGuI4x7hVcv3osdcQrpvwWIHMz3dRLJRbeB6rAse7j7Mh/C37RI4xV0Mf0SUW
 Asp+9ljPHib3SAdnrqw9SwnJGxO5W5JkMjYhpXcVSGcmnkbP4r1mJicu+hB7GPuqpa
 JvhM0cyWPyeHdFJ8VerEASotHuDmcnO2Xm3k8j5B+E3E8kHz6UQruHpRH4smdB02bA
 hOTy4au4S2hg+RUHYDpC0nzhrp/a620BlS/4dTw/w92ozvXrrzY9TEuKileMo+vCYl
 IU8uPAiQuPt3g==
Date: Thu, 23 Dec 2021 17:07:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Cc: Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Eddie Hung <eddie.hung@mediatek.com>, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 1/5] dt-bindings: phy: mediatek: tphy: support
 software efuse load
Message-ID: <YcRflIupKfdPWkHx@matsya>
References: <20211218082802.5256-1-chunfeng.yun@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211218082802.5256-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211223_033802_051932_0FD6D4E9 
X-CRM114-Status: UNSURE (   7.62  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 18-12-21, 16:27, Chunfeng Yun wrote:
> Add optional property nvmem-cells and nvmem-cell-names to support
> software efuse load, this helps to fix the efuse bit shift issue
> on mt8195 etc.

Applied all, thanks

-- 
~Vinod

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
