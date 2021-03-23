Return-Path: <SRS0=7DfI=IV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B809C433DB
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 14:51:58 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96A3060232
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Mar 2021 14:51:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96A3060232
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+QXxR7IGYNxIHBgdWoTsexYtbV0u00W72WPbaDEx8zM=; b=NZTU2we/uhoOPXt+KLE/vFJKJ
	E0Ok2YB2+9/8qHhwAora/I9aE/URumewZfMen8fQxCr59KLuO9H3RWstc9LTMv/pZzpFyWiE4Z/OD
	Bw4qcY/W1FGih7s9ztyOuEJVu+efU1Y/9IpznOcjfneDOrm7MzgAjtrittB78t4tWGzzfCcf4CsKh
	R/AXpy9diPJ7mFaFW8z1ByWhyMqzV/xGVjA5JnY60Vsx5eu1iTMWFxd8lmuUvT15KUErN+k450wf4
	AQs2WFGFcCPW5+JAqPP6/0jE/6lsm25HZL+OaxOlcKfgNiNIBhJ+y4A/IM+DZb6YD6iwwzET092d2
	Jb8lG4N8Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOiNk-00FCRC-9P; Tue, 23 Mar 2021 14:51:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOiNZ-00FCPs-Ug; Tue, 23 Mar 2021 14:51:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A837661983;
 Tue, 23 Mar 2021 14:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616511087;
 bh=hgxdo4ZUUEitXDWs4Mlm83kBINAI4vjmbUS8R5zTyqM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dpkg1HfJVEeaaDXnvy5P0QTofpqOzmmn+SKtNcOu2q3IhyXJwQeuYGE67ash+xPIQ
 F2y6BUnNTPHMx2lKgxOhZp4jHt4kjeTOLU0+3Fg1R7nhf0tdwAOIW6IXpArC90p+yY
 IJjQ6k3C7boc8ebEQnNqMLvgV4L9YQEUALU2By0e3GSty8Po/2cDJu7Nmh16qV+HQZ
 TyU8ox0nbEJovwHDkfE1+LIvayUVp8IJi4DUUA98ZL+m4v7SqMtSQ4Hali2r4EhHds
 ungF7YHvoHMVHuuErZziga+H2O4R31eqQGDSd8XLaQ7DGOgfUlqcmqWii42A4KNG4s
 kG2GTIRddU7uA==
Received: by pali.im (Postfix)
 id 2283192C; Tue, 23 Mar 2021 15:51:25 +0100 (CET)
Date: Tue, 23 Mar 2021 15:51:24 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Amey Narkhede <ameynarkhede03@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, maz@kernel.org,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Sj Huang <sj.huang@mediatek.com>, youlin.pei@mediatek.com,
 chuanjia.liu@mediatek.com, qizhong.cheng@mediatek.com,
 sin_jieyang@mediatek.com, drinkcat@chromium.org,
 Rex-BC.Chen@mediatek.com, anson.chuang@mediatek.com
Subject: Re: [v8,3/7] PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192
Message-ID: <20210323145124.6myowqcjga5ro2pn@pali>
References: <20210224061132.26526-1-jianjun.wang@mediatek.com>
 <20210224061132.26526-4-jianjun.wang@mediatek.com>
 <20210311123844.qzl264ungtk7b6xz@pali>
 <1615621394.25662.70.camel@mhfsdcap03>
 <20210318000211.ykjsfavfc7suu2sb@pali>
 <1616046487.31760.16.camel@mhfsdcap03>
 <20210319185341.nyxmo7nwii5fzsxc@pali>
 <1616463094.25961.8.camel@mhfsdcap03>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1616463094.25961.8.camel@mhfsdcap03>
User-Agent: NeoMutt/20180716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210323_145134_286866_114225C2 
X-CRM114-Status: GOOD (  15.82  )
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

On Tuesday 23 March 2021 09:31:34 Jianjun Wang wrote:
> One more question, is there any chance that we can put this linkup flow
> to a more "standard" way, such as drivers provides the ops of the PERST#
> pin and let the framework to decide how to start a link training, or we
> just use macro to replace this timeout value in the future?

This is something about which I was thinking that could be useful for
pci-aardvark.c driver. But I was not sure if some other driver can
benefit from such "framework". But now I see that your driver is another
candidate which can benefit from it.

Currently there is no such "framework" in kernel and the hardest part
would be to design it.

Having this API would allow kernel to implement and export PCIe Warm
Reset (which is done via PERST# signal) and easily extend Amey's reset
patches to export also Warm Reset via sysfs.

But to implement this framework and using it for reset we first need to
answer questions which I have sent in email:
https://lore.kernel.org/linux-pci/20210310110535.zh4pnn4vpmvzwl5q@pali/

Bjorn, Alex: any opinion about PERST#?

Also see Enrico's email, where confirmed that there are platforms which
shares one PERST# signal for more endpoint cards:
https://lore.kernel.org/linux-pci/1da0fa2c-8056-9ae8-6ce4-ab645317772d@metux.net/

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
