Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D03AC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Oct 2022 22:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0K+tDxY91S4wQ9H7TDLz0f3SDpyKHNBEKeqLz2Ae3E=; b=gjaDDbIaOMNFBU5x0f93aXYg0x
	INWf8ExFwU4R0bxXAzU/xjUZQmuw6CoMbSatAM5Q0v6fhH3S47iOmpYZyus0V8dJARH1GOyaiori2
	fqwyfI9EARa6c3kXtRpDjLs6YLbvDWhpJLc5eCrRCbaropz2lNp+HYRKtdH48jEwzc+mNNzu0Pdl9
	A4kbDp7kakFgvgz8BuMHzpwpBdpVZh0XrY7x6u1RTP5pd+3O7/FG1VGWbfk+GU8bGlWOL/NBZgOVX
	DknjU+aGqj4+7Am9QNhyYTujnduUOGWeh1sC7y4hTwtQxzT+tnxDJsWrqdaDtvJ8zbWOET12cxUuZ
	xyKTXr4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiO4c-0065dP-QM; Tue, 11 Oct 2022 22:50:06 +0000
Received: from smtp-out2.suse.de ([2001:67c:2178:6::1d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiO4S-0065b9-3E; Tue, 11 Oct 2022 22:49:57 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id EC3251F8B0;
	Tue, 11 Oct 2022 22:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1665528590; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u0K+tDxY91S4wQ9H7TDLz0f3SDpyKHNBEKeqLz2Ae3E=;
	b=sRgOJGXbQ4Y3bEg3wrJ7A91VzzgXRjufB+WWTXw8Fvy7noUoSGSDXSs6i+RP7FuuoQxyKM
	OZ42YOHiwgn+lb3fpKyHmerwrlfQ9fIIgtZgY+j3SIh+VCXYA53HRYuicgJBETxnjZzP7M
	HP/LiAFOy76J8FmaE7ocDvFjuRyLPpc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1665528590;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=u0K+tDxY91S4wQ9H7TDLz0f3SDpyKHNBEKeqLz2Ae3E=;
	b=3kKi1MuqL0ir4LNRL+T46XoZVejEqg5Nos7qmaiO9BTUJUH92HmjoMulxxlooPVJx+Eiyc
	1ekIowgP/bfXWhCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
	(No client certificate requested)
	by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 9DB9C13AAC;
	Tue, 11 Oct 2022 22:49:50 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
	by imap2.suse-dmz.suse.de with ESMTPSA
	id kZXdJA7zRWMXDAAAMHmgww
	(envelope-from <jdelvare@suse.de>); Tue, 11 Oct 2022 22:49:50 +0000
Date: Wed, 12 Oct 2022 00:49:49 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Sasha Levin <sashal@kernel.org>
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org, kernel test robot
 <lkp@intel.com>, Matthias Brugger <matthias.bgg@gmail.com>, Chenglin Xu
 <chenglin.xu@mediatek.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH AUTOSEL 6.0 04/46] soc: mediatek: Let PMIC Wrapper and
 SCPSYS depend on OF
Message-ID: <20221012004949.06d45f74@endymion.delvare>
In-Reply-To: <20221011145015.1622882-4-sashal@kernel.org>
References: <20221011145015.1622882-1-sashal@kernel.org>
	<20221011145015.1622882-4-sashal@kernel.org>
Organization: SUSE Linux
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221011_154956_303829_B0949429 
X-CRM114-Status: GOOD (  10.84  )
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

Hi Sasha,

On Tue, 11 Oct 2022 10:49:32 -0400, Sasha Levin wrote:
> From: Jean Delvare <jdelvare@suse.de>
>=20
> [ Upstream commit 2778caedb5667239823a29148dfc48b26a8b3c2a ]
>=20
> With the following configuration options:
> CONFIG_OF is not set
> CONFIG_MTK_PMIC_WRAP=3Dy
> CONFIG_MTK_SCPSYS=3Dy
> we get the following build warnings:
>=20
>   CC      drivers/soc/mediatek/mtk-pmic-wrap.o
> drivers/soc/mediatek/mtk-pmic-wrap.c:2138:34: warning: =E2=80=98of_pwrap_=
match_tbl=E2=80=99 defined but not used [-Wunused-const-variable=3D]
> drivers/soc/mediatek/mtk-pmic-wrap.c:1953:34: warning: =E2=80=98of_slave_=
match_tbl=E2=80=99 defined but not used [-Wunused-const-variable=3D]
>   CC      drivers/soc/mediatek/mtk-scpsys.o
> drivers/soc/mediatek/mtk-scpsys.c:1084:34: warning: =E2=80=98of_scpsys_ma=
tch_tbl=E2=80=99 defined but not used [-Wunused-const-variable=3D]
> (...)

This is warning only, pretty harmless, so I don't think this qualifies
for stable kernel trees.

Thanks,
--=20
Jean Delvare
SUSE L3 Support

