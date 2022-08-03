Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1671C19F28
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Aug 2022 11:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZYlzLgyWu40ADizHKmCXW+EjVh2C0M+Azc1lhdIggI=; b=PGM3FKA9T+HotkGu8KoYzcsOhg
	3Q5q3uaaHo0PwC/QlAubEbor0FzqzaF83FLa+CNk7x6yrkHWF2cq2mqMZuMilVw6DMq8ylmezBxE6
	97sYH79a9+4a3STDjQPnAQfJJgGZWeV2/xXJbHqWnAlx3zQOH0pXdJUIDL5PeSwmBZcZYdUBXtwO9
	0hNjOnD6lZviUtykzJW4v1ZEUyn+MWF5vwFqM6jLGQlhQ50TWftbwDLWVPOaS69rmKoypVahtt1+w
	DjJXi+eBgyNAAzDDzlrtoknY1iRCMGIpncrA3Nq4iwkTVTEC822vVbjXYtYDc/DUbNdEB5fZKNz34
	3hjP1Llg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJCOd-005GRv-DH; Wed, 03 Aug 2022 11:18:39 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJCOb-005GPt-4p; Wed, 03 Aug 2022 11:18:38 +0000
X-UUID: f5b48d9f83df4903bf9871ec2ccc52cc-20220803
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:5f66a49d-511a-47c8-b462-8049168f1f7c,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:eb8c2fd0-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: f5b48d9f83df4903bf9871ec2ccc52cc-20220803
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <kuan-ying.lee@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1512458288; Wed, 03 Aug 2022 04:18:33 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 3 Aug 2022 19:18:30 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Aug 2022 19:18:30 +0800
Message-ID: <e64af337f5bc32ee90e4154642446126040432f9.camel@mediatek.com>
Subject: Re: [PATCH] scripts: Fix no space expression between sp and offset
From: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, <masahiroy@kernel.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<wafgo01@gmail.com>
CC: Chinwen Chang =?UTF-8?Q?=28=E5=BC=B5=E9=8C=A6=E6=96=87=29?=
	<chinwen.chang@mediatek.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-mediatek@lists.infradead.org"
	<linux-mediatek@lists.infradead.org>
Date: Wed, 3 Aug 2022 19:18:30 +0800
In-Reply-To: <20220722063529.7166-1-Kuan-Ying.Lee@mediatek.com>
References: <20220722063529.7166-1-Kuan-Ying.Lee@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220803_041837_235832_7179A6A4 
X-CRM114-Status: GOOD (  17.99  )
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

On Fri, 2022-07-22 at 14:35 +0800, Kuan-Ying Lee wrote:

Cc maintainers.

> When I use older version aarch64 objdump (2.24) to disassemble
> aarch64 vmlinux, I get the result like below.
> There is no space between sp and offset.
> 
> ffff800008010000 <dw_apb_ictl_handle_irq>:
> ffff800008010000:       d503233f        hint    #0x19
> ffff800008010004:       a9bc7bfd        stp     x29, x30, [sp,#-64]!
> ffff800008010008:       90011e60        adrp    x0, ffff80000a3dc000
> <num_ictlrs>
> ffff80000801000c:       910003fd        mov     x29, sp
> ffff800008010010:       a9025bf5        stp     x21, x22, [sp,#32]
> 
> When I use newer version aarch64 objdump (2.35), I get
> the result like below.
> 
> ffff800008010000 <dw_apb_ictl_handle_irq>:
> ffff800008010000:       d503233f        paciasp
> ffff800008010004:       a9bc7bfd        stp     x29, x30, [sp, #-64]!
> ffff800008010008:       90011e60        adrp    x0, ffff80000a3dc000
> <num_ictlrs>
> ffff80000801000c:       910003fd        mov     x29, sp
> ffff800008010010:       a9025bf5        stp     x21, x22, [sp, #32]
> 
> Add no space support of regular expression for old version objdump.
> 
> Signed-off-by: Kuan-Ying Lee <Kuan-Ying.Lee@mediatek.com>
> ---
>  scripts/checkstack.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/checkstack.pl b/scripts/checkstack.pl
> index d2c38584ece6..e404b6b11295 100755
> --- a/scripts/checkstack.pl
> +++ b/scripts/checkstack.pl
> @@ -56,7 +56,7 @@ my (@stack, $re, $dre, $sub, $x, $xs, $funcre,
> $min_stack);
>  	if ($arch =~ '^(aarch|arm)64$') {
>  		#ffffffc0006325cc:       a9bb7bfd        stp     x29,
> x30, [sp, #-80]!
>  		#a110:       d11643ff        sub     sp, sp, #0x590
> -		$re = qr/^.*stp.*sp, \#-([0-9]{1,8})\]\!/o;
> +		$re = qr/^.*stp.*sp, ?\#-([0-9]{1,8})\]\!/o;
>  		$dre = qr/^.*sub.*sp, sp, #(0x$x{1,8})/o;
>  	} elsif ($arch eq 'arm') {
>  		#c0008ffc:	e24dd064	sub	sp, sp, #100	
> ; 0x64
> -- 
> 2.18.0
> 


