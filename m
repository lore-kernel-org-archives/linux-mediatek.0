Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC5CD5AE61
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Nov 2024 05:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZuRUaeq2SVIUcbqz41Eky50lEh8bbVD+B44rIfT5/4=; b=Q5KeaDkDEGLuBTJSzFE/ayS1bz
	axnw89yemFDRLdw76MTYhSwkqomIVsaAj3X9aqBNWi7eCqPR2YTqcffB3gYXdO2QIYCNlHzkDXgQ2
	sxRKQNaYd4/ZNcb5cIrruusVvJzgQckF4wkJHxaILFSEzxeDhvs0ekMDN98lF5M9gpu3sZL0SQX8v
	7Sj5RUnjaRvGMLOFQtnAyOH/TJHkDAOnds3Zh0jEYaf8D9A292BL+mYqlSy68FFhXCDZKWUCMSFUy
	rNOYKE/Y0qDwFOkJ+MkbqECbu6wC/LlQ8InlpNUWhvTk77B2eV5zMJFZ0x4iwlMatzbsscCIpyXIi
	dumP8wgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8utZ-00000005h3t-1eBp;
	Thu, 07 Nov 2024 05:17:25 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8ur6-00000005gja-0xXx;
	Thu, 07 Nov 2024 05:14:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F2A7AA41FBD;
	Thu,  7 Nov 2024 05:12:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2EB45C4CECC;
	Thu,  7 Nov 2024 05:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1730956490;
	bh=iWGb3Yl9quIHI+wNbOzG+7sm0t9ullzXkfB6TkNObxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qDg32I1IACZtoMDuRxAlSPTrcanjkn58Pdda3Y5Q0sOeVXZ+/Cf7Z0XKPE2V9OQRu
	 HJLL3kvWSROiS31MQwIuhUFSJtd56pm7i/LJqdEqXkPZBUGC9DmHdXO5y4J1G3h9Mc
	 eQn3PAdfGFffix5yG/t+uCgicuNo1hge1I2d1Wz4=
Date: Thu, 7 Nov 2024 06:14:31 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Haowei Cheng(Harvey)" <harvey.cheng@fibocom.com>
Cc: "chunfeng.yun@mediatek.com" <chunfeng.yun@mediatek.com>,
	"linux-usb@vger.kernel.org" <linux-usb@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: =?utf-8?B?5Zue5aSN?= =?utf-8?Q?=3A?=
 0001-usb-mtu3-fix-panic-in-mtu3_gadget_wakeup.patch
Message-ID: <2024110735-lunacy-salvation-684c@gregkh>
References: <SEZPR02MB54953820B2A9EEBD807D0ED18E512@SEZPR02MB5495.apcprd02.prod.outlook.com>
 <2024110512-popcorn-germless-01be@gregkh>
 <SEZPR02MB5495A8637098B92CDEBBFC6C8E532@SEZPR02MB5495.apcprd02.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <SEZPR02MB5495A8637098B92CDEBBFC6C8E532@SEZPR02MB5495.apcprd02.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_211452_358765_1762CD6E 
X-CRM114-Status: UNSURE (   8.59  )
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

On Wed, Nov 06, 2024 at 07:39:59PM +0000, Haowei Cheng(Harvey) wrote:
> Hi greg k-h，
> 
> We found during development that when there are data packets to be sent on the USB RNDIS network card,

Also, wait, why in the world are you using RNDIS when it is documented
to be an insecure and broken protocol?  Do you really trust both sides
of that connection?  If so, that's fine, but if not, please do not use
that protocol at all.

thanks,

greg k-h

