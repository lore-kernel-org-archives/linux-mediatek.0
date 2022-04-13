Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF08C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Apr 2022 12:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8tYZXtfMI++iB0ukdGFshItTJJqkljBIZV+n17Tlpo=; b=zdSY8wX3PGY8Tc
	76TBjnNcfBgRdeOHX9HLDCnCL5VHPttPk4oRlD2WMZ4/Ap2LJMJYV4aReRimydanVby7qM3+QOJ+S
	LcA/nW0BZ6jOU0ZsyzObp+JpSYSLXK3tqubNOjSxlu15v9vIQcphZYMOy7RIBlPsC6bxWTzvkueus
	IpuYPhz9rx0YsQf8d19Uim+0PKsUXOHC79jWQ5IbXtleTc+38lzMGJJ6NRcGSKII0grn9xFajoEo2
	oDdFrlUtS/ZrZHdue+JgeL+oEXvhYtkA6Txd7G7K4ktg+C+Rexa/27lWuaoLt4Cj3xN2wnxXYF6ge
	dZV6mqaeHnnjieg/Sh1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1necLl-0012oL-5a; Wed, 13 Apr 2022 12:43:57 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1necLW-0012hH-O2; Wed, 13 Apr 2022 12:43:43 +0000
Received: by mail-ej1-x62f.google.com with SMTP id l7so3717744ejn.2;
 Wed, 13 Apr 2022 05:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :content-transfer-encoding:user-agent:mime-version;
 bh=ftC/R4apSkNj0SBqqxvCqMvFLEojqjXxdMp+rh20DA0=;
 b=g6n6tIhHD0mQsqnftSq0RvbOPkokjzp0OX6uB573Dl4Hg33fSlWFnA34EiK23DLgNh
 eoIYQl8pXTIYUWza3XQk9sgkNkTOak01u7xQM9EFXMBIS52VtmXtfwCB+Yt1FuB3q6f8
 y933dRXKqEq2ryGE6q/m3daCSQsXwBzOxC7DFBy+/2AiutsS6XB9B0L6mfwgGg6Yq204
 2U/sKAEgZobJxZkGlKO+D7Yqr3QNICiikmNIs58QDVMHzZyq948MgiQHO+hl854Sb1Xj
 nISEr9b+v8O049yvizRVjSfLhzmVr4GJneyqFOueBrrP+/f0xoz/E+KAcIGh6iDbfVMh
 S7rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:content-transfer-encoding:user-agent:mime-version;
 bh=ftC/R4apSkNj0SBqqxvCqMvFLEojqjXxdMp+rh20DA0=;
 b=xrNwQVxoBtt7rvQozgvSW0K4HGQdZ6qTGcLqTi+uow7K1ZqOf8RwLznHz6hA5N4/0F
 Rx/PmKf7s7tiqwefpt+AZdql+BEnJPexzgPzUU3hNxwUkJY8cYo7B8LpImUxyIc4n8j4
 WZWmH/SByWTnBg8/5yWBxg4cSAKiBKtgM7U2qNOG13RNDBxEZP4ec6ZdAiwMXphbIYbV
 DMScCbj4re5wWe7riWHOggVz5r0M1qxzotg1GJCtZdOnCKyxSbjxnjzc2X89dDbCNAW+
 31uCFY7H8m24eviszmiVEdAp9dWsZipa3FJuZ/KR/jHXXAl4kyDXzG4VbbwIvrIIbgWA
 eGtQ==
X-Gm-Message-State: AOAM532QFfa0SFYn9mnne1rzCEsnhk/2PgcyEdZQ9uHAbrXmxRvUskE1
 f86u6T0SpX8eNz0NBoLT+wo=
X-Google-Smtp-Source: ABdhPJxBLUBKYgS4v35da4ZjoDNoq81t0xJsPUkR7RcqehVi1bx196PUdi7GyD8EFLWwPQaAnzglvg==
X-Received: by 2002:a17:907:3e0d:b0:6e8:cccd:de80 with SMTP id
 hp13-20020a1709073e0d00b006e8cccdde80mr1951964ejc.162.1649853819459; 
 Wed, 13 Apr 2022 05:43:39 -0700 (PDT)
Received: from [192.168.3.2] (p5dd1ed70.dip0.t-ipconnect.de. [93.209.237.112])
 by smtp.googlemail.com with ESMTPSA id
 z22-20020a1709063ad600b006e8867caa5dsm4098621ejd.72.2022.04.13.05.43.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Apr 2022 05:43:39 -0700 (PDT)
Message-ID: <d67b8969c8d2097377d9dbb414481f11958a9c9f.camel@gmail.com>
Subject: Re: [PATCH 1/1] scsi: ufs: remove redundant HPB unmap
From: Bean Huo <huobean@gmail.com>
To: Peter Wang <peter.wang@mediatek.com>, Po-Wen Kao
 <powen.kao@mediatek.com>,  Alim Akhtar <alim.akhtar@samsung.com>, Avri
 Altman <avri.altman@wdc.com>, "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,  Matthias Brugger
 <matthias.bgg@gmail.com>
Cc: wsd_upstream@mediatek.com, stanley.chu@mediatek.com, 
 alice.chao@mediatek.com, chun-hung.wu@mediatek.com, cc.chou@mediatek.com, 
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com, yohan.joung@sk.com, 
 jason.li@sk.com, linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Date: Wed, 13 Apr 2022 14:43:38 +0200
In-Reply-To: <7e979863-21e5-ba63-862a-8ba6a63a8ae4@mediatek.com>
References: <20220412073131.10644-1-powen.kao@mediatek.com>
 <781bfe33efb1e44d22f71e6711da7d15be9d3ab4.camel@gmail.com>
 <7550da4043ae45ffd58399f1ee696238a5689f25.camel@gmail.com>
 <7e979863-21e5-ba63-862a-8ba6a63a8ae4@mediatek.com>
User-Agent: Evolution 3.44.0-1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220413_054342_816903_6CE7B260 
X-CRM114-Status: GOOD (  12.23  )
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

Hi Peter,


On Wed, 2022-04-13 at 11:53 +0800, Peter Wang wrote:
> Hi Bean,
> 
> How about if reset flow not clear hpb mapping?

UFS will go through normal read, because regions are not active in the
device. The responses mabye different among different vendors. for
example, UFS device will raise a response to host to update the region
(in case of host mode) or inactivate it in case of device mode.

The best way is that inactivate the active regions in the host side in
the case the regions are not active in the device.

> 
> After device is reset by RST_N pin, if the hpb mapping table still
> exist?

no, the regions in the device will be inactivated.

> 
> BTW, Host seem not clear region mapping table in reset flow.
> 

Yes, you are right. There will be a performance impact. I will look at
it, then back to you.

By the way, there is one issue in my patch, ignore that patch.


Kind regards,
Bean


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
