Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128C8C001DC
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Jul 2023 08:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0NjEhu86N4J+fkW2NC3ZP+O5bGE7CvhT29CjHH1Mlg=; b=41qylTiYvj0PChzjxlGPKKOvWC
	9liYwLfrWHJsONGGtyG9q4vpRscEfmBkWtJJN/rMaqS/PtYue3gqIjbhuo1nUKxlMM3o3+oX9Bg5i
	AAAx+zhvD8OIsyaMeXDmtYbtfEqrVR6vcCqJvSLYydALligMyn5KycMYetkCxbaICCBxSTXGENjRN
	/L8YPK9f/YhOGs5w5Rc3awjzXTak898URtbuEal41O5reMLWkFvnK5JET1cRjRnKp/pmQPYUzFF2+
	B2EjkCaQJd99bRwCgcBNuVeFnYkNslyQXqx8TxKPV3m6LMFEG+coZ4AZ/obGQERGig3Uc7oqF80vk
	fENBLEmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2Gg-006FQy-02;
	Wed, 19 Jul 2023 08:10:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM2GU-006FLc-2w;
	Wed, 19 Jul 2023 08:10:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=B0NjEhu86N4J+fkW2NC3ZP+O5bGE7CvhT29CjHH1Mlg=; b=qZUpW+AiGZYAmK2ndNJNcqb7Yt
	SiFhH/l85VWT1J3LWn10jYamAu01EMlW6gxDaulOs8hXZzpAARFxkORIhtBy/gswK8OEf9egJJHwi
	hh2T/YHZM3RCx/NQa6AcMKjs4aOYw8VZsgLOvYysBUpN8+mVcoPsLoOfObJO9zplyfAhvRtTzT/Fu
	2xoybRLR4dlHYyDCsJdv/2G3UDFrUOJjwsRqGy3bX2u9J5DkePKojkTMMMULoCj9Ay92f8Vk/Tny7
	fOFv3AX3lQQPgpvc9t0C5ybLGBN/Je9DpfFlBRHt8iY07TpzzxDATa46zYamOvdEyRlHK77qE6xDj
	erbAMkoQ==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLkrv-00Ba2U-0m;
	Tue, 18 Jul 2023 13:36:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8526461595;
	Tue, 18 Jul 2023 13:35:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77068C433B9;
	Tue, 18 Jul 2023 13:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1689687349;
	bh=B0NjEhu86N4J+fkW2NC3ZP+O5bGE7CvhT29CjHH1Mlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dOHlZSGFJEYqcQFBqTE6cavvulJfUotaf3OEnRe7xZ8rQvpsKexeiEpLeoUFUz3WK
	 WwCXx8kcoFZpsGnZZ/bin2CgC35AQqq0szBzq2o7xp4aG/lBft/pOS93LoMYH48+BI
	 zA5U7riVI+aSNX/c4q3y0LvVOZZ/Y88zadWH0DD4=
Date: Tue, 18 Jul 2023 15:35:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Mukesh Ojha <quic_mojha@quicinc.com>
Cc: linux-samsung-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
	corbet@lwn.net, agross@kernel.org, andersson@kernel.org,
	konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, keescook@chromium.org, tony.luck@intel.com,
	gpiccoli@igalia.com, catalin.marinas@arm.com, will@kernel.org,
	andy.shevchenko@gmail.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-hardening@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	Trilok Soni <quic_tsoni@quicinc.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>
Subject: Re: [PATCH v4 00/21] Add Qualcomm Minidump kernel driver related
 support
Message-ID: <2023071833-clamshell-drinking-188c@gregkh>
References: <1687955688-20809-1-git-send-email-quic_mojha@quicinc.com>
 <2023062814-chance-flounder-f002@gregkh>
 <CAL_JsqLO9yey2-4FcWsaGxijiS6hGL0SH9VoMuiyei-u9=Cv=w@mail.gmail.com>
 <CACRpkda3CJ7G4-wDPkWmzg6nyCoEfG+u2cQH6KXWNjbftd90ow@mail.gmail.com>
 <355de4c7-180d-4edd-b6fd-9c8e29e40e42@quicinc.com>
 <52650970-de78-764f-28e2-ee0115b7d5c6@quicinc.com>
 <e4784d1c-73da-9cda-6aef-d02625e8efd2@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e4784d1c-73da-9cda-6aef-d02625e8efd2@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230718_143559_817181_528FA46B 
X-CRM114-Status: UNSURE (   8.10  )
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

On Tue, Jul 18, 2023 at 11:17:12AM +0530, Mukesh Ojha wrote:
> + linux-samsung-soc@vger.kernel.org
> + linux-mediatek@lists.infradead.org

What does that do?

confused,

greg k-h

