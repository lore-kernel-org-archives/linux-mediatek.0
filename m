Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FC8EC04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 21:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gOm5WzTFcp6H1IZFGOjdTMXk3A3yXZdzdCMWdzGm6XM=; b=HDvtH2ffQ1k7OPqUytr9ew0nYt
	97a9D9YjxjzFmB7cJIeOLjG0dBuLHrfiuHqtei/npXbo0dqF4OsSQrSecMQl6usxkCFoz2PeMTPu1
	fh2vriSwOmcA0DkGuFl7wxJqZFXLIqoKQJ52PBPiPDIvLVPzxMSE5Bc0KY6pwWRwOKTuywVGNiQm/
	5/lcOCIyRexTCfjLqm4QFgfBAnhu/YlMtV+P3yy8GUbbXO030QpVCOQPXASnsN+PYfWGf+X2hMtXg
	2x5uFieb0c9VzeE2RlHoNhawdrhKruzgq271XFTjadKcXh5cPbL3xZVTuVZvKjXdlSZ9NmRdWN29/
	Aemavs6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHB1g-00EdHv-Ph; Thu, 28 Jul 2022 21:26:36 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oHB1e-00EdGg-9u
	for linux-mediatek@lists.infradead.org; Thu, 28 Jul 2022 21:26:35 +0000
Received: by mail-ej1-x62c.google.com with SMTP id bp15so5251998ejb.6
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Jul 2022 14:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :content-transfer-encoding:user-agent:mime-version;
        bh=gOm5WzTFcp6H1IZFGOjdTMXk3A3yXZdzdCMWdzGm6XM=;
        b=HOhRdQU+mkVcqXA0SwSceYUDsOYp3cQTUQp33i5l/isCD+eWR/FkCNRf+5ruq623yU
         3Kp89ReMWspmMKIWuifPkuE6pGWSEEbiOq/B9DY0yO1iSZ/BzifnDNlHSAa4SGfHC/ws
         KchLVp1vsdBkzyT7dww+hstw3/w6SBRxEYHb0+ZDMV6nvnRbR0LdL5EAGMs3uNt99gSI
         ioO5EZQ7VhgUcThIojfugYl4MHHRtP5+rdMG8U8I8JAUJ1O3vqmQ9e7eqCP2InzJIZY4
         ZANUP0zz7tRqrK0JqRpl8+YxtH6zPzSwQvIcEQpZu0Zxm/v2UhHsqxb/HRSXR01+mK9p
         OjJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:content-transfer-encoding:user-agent:mime-version;
        bh=gOm5WzTFcp6H1IZFGOjdTMXk3A3yXZdzdCMWdzGm6XM=;
        b=0GD/MvFpaa4yQM/Rz+Op/igrGsvhFzJhNnuRlRzsik6e1PMppqEIId3aNxQ1/p/vT5
         0+VdLMd601d4rs3bdWFzSLDHv0FxkCCfi+W6FcILpDpQi66LnQqH5Lpc8GiOJ3n2c0eo
         K0rzQamzk6hpsSmYu6C3bKDWHQNJoG6sgn7Ck6gy9ipx5TmmEV6NVJtBRskA4Fv9d2Tf
         xaQ09KQ5zGSm7PaBtLsutIA+ZWMSkJJs+o6JA9liEeyMolSb7qf8uPXbQoMZul87dZed
         Hw4OlbucJyvwx3BcBgjP2uxEgK2q3n+O41Hi2Hy5xSKpnDpzmFNg0uw857ldTzlO7AWx
         Cp3Q==
X-Gm-Message-State: AJIora+NwU2fgsY3cXAsJWedzUYOGzOLXtvK5ZqgpX9+e8G9NEaI+l4p
	9x71FSpFd8yFb34Sy3hoLgNDGYSTc2xdNg==
X-Google-Smtp-Source: AGRyM1sjMC9NeXxDwGxrbYL6KH/FQzVMzZ1dXYM4nN6jLAFPMfO0gGy9dUfKZGZZUyhKSxd0H5ZhzA==
X-Received: by 2002:a17:906:58d1:b0:72e:e049:cf00 with SMTP id e17-20020a17090658d100b0072ee049cf00mr571193ejs.361.1659043590978;
        Thu, 28 Jul 2022 14:26:30 -0700 (PDT)
Received: from p200300c5870e1483ac11a16c0f4ae195.dip0.t-ipconnect.de (p200300c5870e1483ac11a16c0f4ae195.dip0.t-ipconnect.de. [2003:c5:870e:1483:ac11:a16c:f4a:e195])
        by smtp.googlemail.com with ESMTPSA id wi7-20020a170906fd4700b0072f03d10fa0sm814398ejb.207.2022.07.28.14.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 14:26:30 -0700 (PDT)
Message-ID: <e2fba3fe9b10d060a9906c440dd1f55e52404d77.camel@gmail.com>
Subject: Re: [PATCH v1 0/2] ufs: allow vendor disable wb toggle in clock
 scaling
From: Bean Huo <huobean@gmail.com>
To: Bart Van Assche <bvanassche@acm.org>, peter.wang@mediatek.com, 
 stanley.chu@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com,  avri.altman@wdc.com, alim.akhtar@samsung.com,
 jejb@linux.ibm.com
Cc: wsd_upstream@mediatek.com, linux-mediatek@lists.infradead.org, 
 chun-hung.wu@mediatek.com, alice.chao@mediatek.com, cc.chou@mediatek.com, 
 chaotian.jing@mediatek.com, jiajie.hao@mediatek.com,
 powen.kao@mediatek.com,  qilin.tan@mediatek.com, lin.gui@mediatek.com
Date: Thu, 28 Jul 2022 23:26:29 +0200
In-Reply-To: <968f5255-f7b9-e011-2bd3-aa711bdd142a@acm.org>
References: <20220728071637.22364-1-peter.wang@mediatek.com>
	 <968f5255-f7b9-e011-2bd3-aa711bdd142a@acm.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.1-0ubuntu1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_142634_362475_23C6EAE8 
X-CRM114-Status: GOOD (  14.20  )
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

On Thu, 2022-07-28 at 14:09 -0700, Bart Van Assche wrote:
> On 7/28/22 00:16, peter.wang@mediatek.com=C2=A0wrote:
> > Mediatek ufs do not want to toggle write booster when clock
> > scaling.
> > This patch set allow vendor disable wb toggle in clock scaling.
>=20
> I don't like this approach. Whether or not to toggle the write
> booster=20
> when scaling the clock is not dependent on the host controller and
> hence=20
> should not depend on the host controller driver.
>=20
> Has it been considered to add a sysfs attribute in the UFS driver
> core=20
> to control this behavior?
>=20

Bart,=20
we already have wb_on sysfs node, but it only allows to write this node
when clock scaling is not supported.


static ssize_t wb_on_store(..)
{
	struct ufs_hba *hba =3D dev_get_drvdata(dev);
	unsigned int wb_enable;
	ssize_t res;

	if (ufshcd_is_clkscaling_supported(hba)) {
		/*
		 * If the platform supports
UFSHCD_CAP_AUTO_BKOPS_SUSPEND,
		 * turn WB on/off will be done while clock scaling
up/down.
		 */
		dev_warn(dev, "To control WB through wb_on is not
allowed!\n");
		return -EOPNOTSUPP;
	}


Kind regards,
Bean

> Thanks,
>=20
> Bart.


