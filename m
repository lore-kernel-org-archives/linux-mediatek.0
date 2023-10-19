Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 367ADCDB482
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 07:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/ExAtAUFm918w30hOEMgGU1kfUzyycn7oMYoVsXzuFQ=; b=4d1vu5KvQqRp+Zcc5SJo6PsRcQ
	AWCJHPJ+w/AQWkLUcXvorX6M/gWOpXk8YR9GRqwxBGJ2Ia8tMlNSm5FM9wtJIhwtsozm1dbfbZbf0
	NNQ8wC2HFBpgyMRpOGexm77r0Ge6D/OnsU8UVCclMxY6CmFu3+6YDBhRC6RY1gNGYwy8rAhVWI9Kt
	1yGmBAznFJ9lWuOKtCCKygpqP/ZtpVX3EaxTfJypTh0AUYfhxOWggsX68ik3wfcS0jFoT8noXq9vL
	/4oOuuEmW8lczcSdJRJQpkoQoneGQFxOmW3ZhheES7oSjCRsEidqTfbi5hyRkQwgaPE3ftyVaeRvt
	57mlyXiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtNDa-00GaAA-2L;
	Thu, 19 Oct 2023 07:13:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtNDX-00Ga9P-0i;
	Thu, 19 Oct 2023 07:13:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=/ExAtAUFm918w30hOEMgGU1kfUzyycn7oMYoVsXzuFQ=; b=SHj4LQnzfHMa1yHTUuvP7nMolw
	VpESHZXD7leV7Tbxyrk8gTDRViNqV7hH7qjyAKEWJSWNKlsUSjEXsDGqfQHkuNBhM10wHuK18kDBv
	6sfgJG1uJU0m0OEIDstoqhoxmXcZCshS/z5rpOaHEiPwEGUsanO8VOHiSc/rk4xoKPerI6QP5fo2x
	Pj6SuGxSsFToLToB+dKON9i1ajaoXSnK+tXiGX4gvE8SxT+c3ey7hGilx/Dhe6FAnpk4sdQg0XG2E
	5szP3MrjA/amJ6XvPiyo0+C/gipY7t1QhISPZ3uSOxSbTzc+lfA9jXw5+PPxc4PZ0iRK8GQtocbhf
	1cGobnRA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40768)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1qtNDJ-0006Vk-0Q;
	Thu, 19 Oct 2023 08:13:01 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1qtNDC-0000EU-DM; Thu, 19 Oct 2023 08:12:54 +0100
Date: Thu, 19 Oct 2023 08:12:54 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mark-PK Tsai =?utf-8?B?KOiUoeaym+WJmyk=?= <Mark-PK.Tsai@mediatek.com>
Cc: "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>,
	"robin.murphy@arm.com" <robin.murphy@arm.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"xuewen.yan@unisoc.com" <xuewen.yan@unisoc.com>,
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	YJ Chiang =?utf-8?B?KOaxn+iLseadsCk=?= <yj.chiang@mediatek.com>
Subject: Re: [PATCH v2] ARM: vfp: Add missing VFP instructions to
 neon_support_hook
Message-ID: <ZTDW9nflL1TM0svt@shell.armlinux.org.uk>
References: <20230925131720.7672-1-mark-pk.tsai@mediatek.com>
 <7e68377e780a2f4312a69ce8afda0cda8ad84568.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e68377e780a2f4312a69ce8afda0cda8ad84568.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_001315_259517_C511EC35 
X-CRM114-Status: GOOD (  18.88  )
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

On Wed, Oct 11, 2023 at 02:49:44AM +0000, Mark-PK Tsai (蔡沛剛) wrote:
> On Mon, 2023-09-25 at 21:17 +0800, Mark-PK Tsai wrote:
> > Add the missing "Unconditional Advanced SIMD and floating-point
> > instructions" in [1] to the VFP undef hook.
> > 
> > This commit addresses the issue reported in [2], where
> > executing the vudot instruction on a platform with FEAT_DotProd
> > support resulted in an undefined instruction error.
> > 
> > Link: 
> > https://developer.arm.com/documentation/ddi0597/2023-06/?lang=en [1]
> > Link: 
> > https://lore.kernel.org/lkml/20230920083907.30479-1-mark-pk.tsai@mediatek.com/
> >  [2]
> > Signed-off-by: Mark-PK Tsai <mark-pk.tsai@mediatek.com>
> > ---
> >  arch/arm/vfp/vfpmodule.c | 18 ++++++++++++++++++
> >  1 file changed, 18 insertions(+)
> > 
> > diff --git a/arch/arm/vfp/vfpmodule.c b/arch/arm/vfp/vfpmodule.c
> > index 7e8773a2d99d..b68efe643a12 100644
> > --- a/arch/arm/vfp/vfpmodule.c
> > +++ b/arch/arm/vfp/vfpmodule.c
> > @@ -800,6 +800,24 @@ static struct undef_hook neon_support_hook[] =
> > {{
> >  	.cpsr_mask	= PSR_T_BIT,
> >  	.cpsr_val	= PSR_T_BIT,
> >  	.fn		= vfp_support_entry,
> > +}, {
> > +	.instr_mask	= 0xff000800,
> > +	.instr_val	= 0xfc000800,
> > +	.cpsr_mask	= 0,
> > +	.cpsr_val	= 0,
> > +	.fn		= vfp_support_entry,
> > +}, {
> > +	.instr_mask	= 0xff000800,
> > +	.instr_val	= 0xfd000800,
> > +	.cpsr_mask	= 0,
> > +	.cpsr_val	= 0,
> > +	.fn		= vfp_support_entry,
> > +}, {
> > +	.instr_mask	= 0xff000800,
> > +	.instr_val	= 0xfe000800,
> > +	.cpsr_mask	= 0,
> > +	.cpsr_val	= 0,
> > +	.fn		= vfp_support_entry,
> >  }};
> 
> Could someone please kindly review this patch?
> Thanks.

And if someone drops it into the patch system then it might get applied
before the merge window.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

