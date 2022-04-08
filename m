Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F706C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 13:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:From:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dObGrHZYdTT+TA9YOSk2BvFfiLbOE11dvFGGwfJhGZE=; b=A3L29+MF2RcEFn
	EM1mRp7J8FxaiGp/FirkGawD1nFw2vVQvVN7aAnSSwNdSYt2lywJgN4T8upTB2DuGIGaLqMzSJtP7
	gfKccL4pVf1v4ER9qR0H/VMS/wfrj3NUnZPblDjEhx6CeI3SUGreaBI29DqfMZ5TdJ6sxZ0Ni7evG
	T5FD5Vg6uLbuAOGRhCpdoxmB6je08inwnZ3Wmb/Pvh+NwVwSpqJZYZUBJp4WM9R4plLey0YaD71NS
	7poXkWOm6SqUuP6peJ95OtKnc1G+i5rBs+R6TvwL0aLrOsmRtvaGl2mab9HdwgpIOvdmrr2sCTjVG
	kU0xlorlN0fcMYIH1mPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncosg-00HRh2-Fy; Fri, 08 Apr 2022 13:42:30 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nconW-00HOib-R9; Fri, 08 Apr 2022 13:37:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id A7CDF1F47188
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649425029;
 bh=54quhn/zcNV/OyUct9dWukFBbRxR9hvJRWQMiW6sCMY=;
 h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
 b=a790tagqq/cSScw2+pEAkFZs4ODYsEALKzkYipCfDpIgNBZYrz7neYeDHeemMDPXM
 1Do4MamfK4mhCqkPB6gJ9tktP35c0Vq+S2oCTgd8xeu2LClyqD2GzojfTquNlBdpFy
 gJnmoMWvh8rfh1jOKBMUKqTpbx95X5ZjvLj1fbfEHNM8+ewAnhUTEJYHfRR2/zOnZS
 JPPQOuxJzG/MWoyBtRd9vYQtsZ6pzfmKCfIwR78KfQutxG+id6T2RLrcMHpJjvx7wK
 6zmpDLJvtA3PclMYGXkxgn0D+k1uvuSuyEKCs0/sO1kA56joBVPzlupNx0aNBkrD0i
 FrIjwJ0OyncaA==
Message-ID: <3e0225dc-810a-4890-47d0-796ff79b7175@collabora.com>
Date: Fri, 8 Apr 2022 15:37:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH V2 14/15] cpufreq: mediatek: Add support for MT8186
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-15-rex-bc.chen@mediatek.com>
Content-Language: en-US
In-Reply-To: <20220408045908.21671-15-rex-bc.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_063711_451771_EC38B02B 
X-CRM114-Status: UNSURE (   7.15  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 08/04/22 06:59, Rex-BC Chen ha scritto:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> The platform data of MT8186 is different from previous MediaTek SoCs,
> so we add a new compatible and platform data for it.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Signed-off-by: Rex-BC Chen <rex-bc.chen@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
