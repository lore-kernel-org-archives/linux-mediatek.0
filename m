Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9BEC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 12:07:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bAHkz3zp5T/EE86+sebi6AGWkiDzaTnK6JdFgHnJ7do=; b=zifqOhzDZNKp5k
	WPsvnNoUtuEP1TDjJcy/3p/YSNbVYGxvF6CUgsp2lZYW71NLCP86KFi8VGS/o9xQE4+Ozp0lrKtSW
	FA2DDB4gi6uRvJSJBUExAWomPafEUK8+quVdGqbykY8du8QUejm+7E2pJsyU40BTyP1xmG8z1Gh9U
	9Cz3yjZ7t0JF9vmWBhIhuhqXNVqIgGWHIdjQHPN73lG5tiWSoN5BfnCxnk2ngkUj45QhK2wLvgZaQ
	QSgnvYVZPXbe3Ww03wWIWa9AbmSUF8XflpFfBU8vrM/8pMHEvY+cHfcHpgXFeCOHMeCNgOT7FbmFQ
	v6/cpm3Myg+djayDgfcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndsph-008sPp-QU; Mon, 11 Apr 2022 12:07:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndspe-008sNN-Bv; Mon, 11 Apr 2022 12:07:47 +0000
X-UUID: 2448efdcc36244488f3d3375bad9c455-20220411
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=pJepDSHf7dLG5ZEBERYWF16d4dnVDuKSQqq7WyBVtpM=; 
 b=HzaHW0efzETZCJg6I5KF1FN/PVF4toPgyC04xcNdnM7yvkIFxme8H35cAnwhUPHPnrTU0LfU9VS2Nw1C+x67XWhn9kFR6E/88IoRc7h1cxLBvy7/qGdG0Rqm8ez+LOBW9a4f5LwHALRYqqxSnIrfYjrU8yO075bixkinBgTFGo0=;
X-UUID: 2448efdcc36244488f3d3375bad9c455-20220411
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <yunfei.dong@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 445997971; Mon, 11 Apr 2022 05:07:43 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 11 Apr 2022 05:07:42 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Mon, 11 Apr 2022 20:07:40 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 11 Apr 2022 20:07:40 +0800
Message-ID: <2d6b3e21c473a17fa7c81162dd0c8337bfefe3ad.camel@mediatek.com>
Subject: Re: pull request: linux-firmware: Create Mediatek MT8192 SCP firmware
From: "yunfei.dong@mediatek.com" <yunfei.dong@mediatek.com>
To: Josh Boyer <jwboyer@kernel.org>
CC: Linux Firmware <linux-firmware@kernel.org>, linux-mediatek
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>, 
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 <tinghan.shen@mediatek.com>, Irui Wang <irui.wang@mediatek.com>,
 <srv_heupstream@mediatek.com>
Date: Mon, 11 Apr 2022 20:07:40 +0800
In-Reply-To: <CA+5PVA5h0NsA5P+AUWrOOQ4gqu6oMqtDUf2HO=rV30iCyiiHTw@mail.gmail.com>
References: <20220408062722.26813-1-yunfei.dong@mediatek.com>
 <CA+5PVA5h0NsA5P+AUWrOOQ4gqu6oMqtDUf2HO=rV30iCyiiHTw@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_050746_452266_2EF0FDFA 
X-CRM114-Status: GOOD (  18.01  )
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

Hi Josh,

Thanks for your remind.
On Mon, 2022-04-11 at 07:17 -0400, Josh Boyer wrote:
> On Fri, Apr 8, 2022 at 2:27 AM Yunfei Dong <yunfei.dong@mediatek.com>
> wrote:
> > 
> > The following changes since commit
> > 681281e49fb6778831370e5d94e6e1d97f0752d6:
> > 
> >   amdgpu: update PSP 13.0.8 firmware (2022-03-18 07:35:54 -0400)
> > 
> > are available in the Git repository at:
> > 
> >   https://github.com/yunfeidongmediatek/linux_fw_scp_8192 v1
> > 
> > for you to fetch changes up to
> > 3ac2fc85bc7dfcebdb92b5b5808b0268cdfb772d:
> > 
> >   mediatek: Add mt8192 SCP firmware (2022-04-08 10:59:44 +0800)
> > 
> > ----------------------------------------------------------------
> > Yunfei Dong (1):
> >       mediatek: Add mt8192 SCP firmware
> > 
> >  mediatek/mt8192/scp.img | Bin 0 -> 309436 bytes
> >  1 file changed, 0 insertions(+), 0 deletions(-)
> >  create mode 100644 mediatek/mt8192/scp.img
> 
> This needs an entry added to the WHENCE file
> 
> [jwboyer@vader linux-firmware]$ ./check_whence.py
> E: mediatek/mt8192/scp.img not listed in WHENCE
> 
> Can you fix this and let me know when it's ready to pull?
> 
> josh
Fix it in the latest v1 branch.

Best Regards,
Yunfei Dong

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
