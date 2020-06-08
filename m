Return-Path: <SRS0=8MsW=7V=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72B57C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 13:50:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 44BCA206C3
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Jun 2020 13:50:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FLyjMW2G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 44BCA206C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vSt4vc/CPBY/RsJ6zyuzehcCcuayz8bS0RHHAqf74ik=; b=FLyjMW2GdiPq7dltzJxLjEcNd
	J6nMiBDqZU8a2BirTN0JC6gRypxX3pJ7By5ng9qZulYKeJq06wnnahtQrfXPCUVg1A81PQ2auxXEw
	/SDbENA0gxcnz/Zp/cSUDyDXnbftWAbt5Zdg/7MX+xH0SdxmYCVC4ptzZipmCsMNiqPdJrGONAELO
	XLKaEfc1+FpgrPlPtQiE8ptgMhYOKt0Fl6XxOtDa8osbqzBsAilZNv9IqPxoSqSFe0/fFisrB/WzA
	VSJUUDLmNcWFKeMIhQovuD3r1FiCa36iVMUm4HJB9+08yzLvkB2+ELCxcrooxNfV2YOljUtwH/hZ5
	XerE/hSWg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jiIAP-0005SI-BH; Mon, 08 Jun 2020 13:50:21 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jiIA5-0002q4-6I; Mon, 08 Jun 2020 13:50:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E896831B;
 Mon,  8 Jun 2020 06:49:59 -0700 (PDT)
Received: from [10.37.12.95] (unknown [10.37.12.95])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A53A3F52E;
 Mon,  8 Jun 2020 06:49:56 -0700 (PDT)
Subject: Re: [PATCH v8 4/8] PM / EM: add support for other devices than CPUs
 in Energy Model
To: Dan Carpenter <dan.carpenter@oracle.com>
References: <20200608115155.GY30374@kadam>
 <b347fb60-46d3-e59c-59fa-a2b10932fc49@arm.com> <20200608125127.GN22511@kadam>
 <da0debe1-73da-33f1-c24e-154c2123c522@arm.com> <20200608132507.GP22511@kadam>
From: Lukasz Luba <lukasz.luba@arm.com>
Message-ID: <f52c83d1-8968-25a2-2d6f-f3eeceae15cb@arm.com>
Date: Mon, 8 Jun 2020 14:49:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200608132507.GP22511@kadam>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200608_065001_273476_2408B890 
X-CRM114-Status: GOOD (  10.70  )
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
Cc: kbuild-all@lists.01.org, lkp@intel.com, linux-pm@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, kbuild@lists.01.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 cw00.choi@samsung.com, linux-mediatek@lists.infradead.org, linux-imx@nxp.com,
 linux-omap@vger.kernel.org, Dietmar.Eggemann@arm.com,
 linux-arm-kernel@lists.infradead.org, Dan Carpenter <error27@gmail.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 6/8/20 2:25 PM, Dan Carpenter wrote:
> It's not really a proper bug report so it doesn't deserve a reported-by.
> 
> Thanks, though!
> 
> regards,
> dan carpenter
> 

Thank you Dan for your work. This is very much appreciated!

Lukasz

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
