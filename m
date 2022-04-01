Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A05C2C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Apr 2022 06:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6m7DisteQzfrPNcgKEvUYT4bG9yAY3doqLp322ta/Mc=; b=PBfSauQuvzpktc
	a8IhM+xaTK7YL6uFbKg8ggUvzgFWIfBtCLsJelY2zdjrRp4tM9TQXJtuaP88bbP7SGyEYR3D79yDS
	xxMFlvnbCRc/o5wDzWuREHtbtkbUaG+/UmQ/RKUwM5rXbMApGnst9tf8xXtwUGzaMdkQ89cMLYsp3
	NEQWYsmm9PQHFqs4cG6FR4hs9QI6vMaGwRigB26hmilMxLiBY8EhXiNWDmJO2DReIV8Dp49hkop/Y
	FQax0VQ/tdTkC6fSB6uahUrZolPuxXCdMW/ZDdj7lxZUWrWqIsG5/1VCFlepxMuJJ7eLsfqBbLDz4
	UVKSzadTZ1LFoE7R1OmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1naB6V-004hdR-JN; Fri, 01 Apr 2022 06:49:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1naB6S-004hd4-KY
 for linux-mediatek@lists.infradead.org; Fri, 01 Apr 2022 06:49:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 298AC6160B;
 Fri,  1 Apr 2022 06:49:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09D3BC2BBE4;
 Fri,  1 Apr 2022 06:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648795786;
 bh=R8Df+NZA+D+ArFodW3Esz53VOD/MqNamehLFj8foYkQ=;
 h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
 b=j+7+GdVQXk3qMD93Y9qDMVGwe6k7Ac4JU2DD7S3/dUT/WsN11EXoMGeHDsKHewEff
 u7bVkzj8gePf+3V4nelVDP4uhMN/Tb6PVjQMyUbf57R126mzTt/TzxuqF3/KABwquk
 5dshjUxfNje2CNe/HLMQU5AaHg4TRcAxEwr5MDv0G1m9pyxn8ca0U9+xH6IgXo56gn
 s6siGVvzkwb4WWZKmEhWB19a4eiYG+3WN8l4PFz1ARYtUprpHDRdXu3FsIrpGaHLfJ
 vAZ+zlueN+TFaOpYDnN/8RSKMIaRlX9pW7ElSS0z4lfhPXm61SrPDCAoPAWjML3nGc
 aVMWTsoDR7FLQ==
From: Kalle Valo <kvalo@kernel.org>
To: <sean.wang@mediatek.com>
Cc: <nbd@nbd.name>, <lorenzo.bianconi@redhat.com>, <Soul.Huang@mediatek.com>,
 <YN.Chen@mediatek.com>, <Leon.Yen@mediatek.com>, <Eric-SY.Chang@mediatek.com>,
 <Deren.Wu@mediatek.com>, <km.lin@mediatek.com>, <jenhao.yang@mediatek.com>,
 <robin.chiu@mediatek.com>, <Eddie.Chen@mediatek.com>, <ch.yeh@mediatek.com>,
 <posh.sun@mediatek.com>, <ted.huang@mediatek.com>, <Eric.Liang@mediatek.com>,
 <Stella.Chang@mediatek.com>, <Tom.Chou@mediatek.com>, <steve.lee@mediatek.com>,
 <jsiuda@google.com>, <frankgor@google.com>, <jemele@google.com>,
 <abhishekpandit@google.com>, <shawnku@google.com>,
 <linux-wireless@vger.kernel.org>, <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH] mt76: mt7921: Add hotspot mode support
References: <734908dd741b85b7cc3855f23596cc5884c335e4.1648765636.git.objelf@gmail.com>
Date: Fri, 01 Apr 2022 09:49:37 +0300
In-Reply-To: <734908dd741b85b7cc3855f23596cc5884c335e4.1648765636.git.objelf@gmail.com>
 (sean wang's message of "Fri, 1 Apr 2022 06:32:24 +0800")
Message-ID: <877d89uwla.fsf@tynnyri.adurom.net>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220331_234948_752232_8DE96BD6 
X-CRM114-Status: UNSURE (   8.85  )
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

<sean.wang@mediatek.com> writes:

> From: Sean Wang <sean.wang@mediatek.com>
>
> add hostspot mode support to mt7921 that can work for mt7921[e,s,u]
> with the common code.
>
> Tested-by: Deren Wu <deren.wu@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Hotspot mode? Why not call it just AP mode? No need to confuse people
with different terminology.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
