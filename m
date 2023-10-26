Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CF4CC25B6B
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 22:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OFo3OVY2sWiI6L9qwNBHTtWnVzB6+IFDI7DXCQ0i9Dk=; b=xpHKsz99SUlQV3fr6Jy4Wk8NXY
	SaqPvQ4RnYA0H/D2rlBacXj+HpHj8v8qV/3s2FtpGHK34CJGWdqRDWFNSynjk8vYrOVbOqa9Bv9wC
	lOoh01OI40dG6AkziS/yobVYA4j/LGla9KsDstpzkRUbCRvuwwUEErpGOYrU09hdY+OaqbVITMSef
	kMxwzs+xOK8heysYClR7bogmV63pWo+wnBKx4DRl4MGsPi06C3CQL62EynqMMkGkbJnRBbUVWVWlW
	y1qtT4M3Z2yfsxthLxcV2eCJjJ+u/+D/APIv8dignk7qHf2uTgtS5xfAubx0gpGCfxdWDNsD2Ld7M
	DGXt2BUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw90b-00FGtj-2t;
	Thu, 26 Oct 2023 22:39:21 +0000
Received: from smtprelay0013.hostedemail.com ([216.40.44.13] helo=relay.hostedemail.com)
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw90X-00FGsb-1h;
	Thu, 26 Oct 2023 22:39:19 +0000
Received: from omf03.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay03.hostedemail.com (Postfix) with ESMTP id E0508A06DD;
	Thu, 26 Oct 2023 22:39:08 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf03.hostedemail.com (Postfix) with ESMTPA id 229B46000C;
	Thu, 26 Oct 2023 22:38:40 +0000 (UTC)
Message-ID: <8521c712250bcffce5c71e8d2b2574de786d4572.camel@perches.com>
Subject: Re: [PATCH next v2 2/3] checkpatch: add ethtool_sprintf rules
From: Joe Perches <joe@perches.com>
To: Justin Stitt <justinstitt@google.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Shay Agroskin
 <shayagr@amazon.com>, Arthur Kiyanovski <akiyano@amazon.com>, David Arinzon
 <darinzon@amazon.com>, Noam Dagan <ndagan@amazon.com>, Saeed Bishara
 <saeedb@amazon.com>, Rasesh Mody <rmody@marvell.com>, Sudarsana Kalluru
 <skalluru@marvell.com>, GR-Linux-NIC-Dev@marvell.com, Dimitris Michailidis
 <dmichail@fungible.com>, Yisen Zhuang <yisen.zhuang@huawei.com>, Salil
 Mehta <salil.mehta@huawei.com>, Jesse Brandeburg
 <jesse.brandeburg@intel.com>,  Tony Nguyen <anthony.l.nguyen@intel.com>,
 Louis Peens <louis.peens@corigine.com>, Shannon Nelson
 <shannon.nelson@amd.com>, Brett Creeley <brett.creeley@amd.com>, 
 drivers@pensando.io, "K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang
 <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, Dexuan Cui
 <decui@microsoft.com>, Ronak Doshi <doshir@vmware.com>, VMware PV-Drivers
 Reviewers <pv-drivers@vmware.com>, Andy Whitcroft <apw@canonical.com>,
 Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn
 <lukas.bulwahn@gmail.com>, Hauke Mehrtens <hauke@hauke-m.de>, Andrew Lunn
 <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>,  Vladimir Oltean
 <olteanv@gmail.com>, =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?=
 <arinc.unal@arinc9.com>, Daniel Golle <daniel@makrotopia.org>, Landen Chao
 <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Linus
 Walleij <linus.walleij@linaro.org>, Alvin =?UTF-8?Q?=C5=A0ipraga?=
 <alsi@bang-olufsen.dk>, Wei Fang <wei.fang@nxp.com>, Shenwei Wang
 <shenwei.wang@nxp.com>, Clark Wang <xiaoning.wang@nxp.com>, NXP Linux Team
 <linux-imx@nxp.com>, Lars Povlsen <lars.povlsen@microchip.com>, Steen
 Hegelund <Steen.Hegelund@microchip.com>, Daniel Machon
 <daniel.machon@microchip.com>,  UNGLinuxDriver@microchip.com, Jiawen Wu
 <jiawenwu@trustnetic.com>, Mengyuan Lou <mengyuanlou@net-swift.com>, Heiner
 Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>,
 Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann
 <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, John
 Fastabend <john.fastabend@gmail.com>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org, Nick Desaulniers
 <ndesaulniers@google.com>, Nathan Chancellor <nathan@kernel.org>, Kees Cook
 <keescook@chromium.org>, intel-wired-lan@lists.osuosl.org, 
 oss-drivers@corigine.com, linux-hyperv@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 bpf@vger.kernel.org
Date: Thu, 26 Oct 2023 15:38:39 -0700
In-Reply-To: <20231026-ethtool_puts_impl-v2-2-0d67cbdd0538@google.com>
References: <20231026-ethtool_puts_impl-v2-0-0d67cbdd0538@google.com>
	 <20231026-ethtool_puts_impl-v2-2-0d67cbdd0538@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
MIME-Version: 1.0
X-Rspamd-Queue-Id: 229B46000C
X-Stat-Signature: mtojnbfkhmj945izba58at9t64m9az5b
X-Rspamd-Server: rspamout08
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/UB5xXHbX1I6Iwr1/WX9S8fJXYcv2DOVQ=
X-HE-Tag: 1698359919-976100
X-HE-Meta: U2FsdGVkX1/Amx6RsPXMmp/lJzH0XSfOupRJb1kmsjddDIYEwUvtXmlXvcoG0HQxgfJeu/bgjCSmBW9XNko/mFTeWhpzlQGj+sHcroC4+SQucDoul9/mW561AqHS3bN32ZhIbH4y4PO56Z7gmbgk+jEv1lNmijdnNQn2GDoTkX/tD06ZkKPHkXJTWWOiblBjoSzVelzS2tuc0jq7rbU2KN7wKu2c9SCdLcBX7eDcPHw0DYjtwdWRO7eI8BixY9+TH41p+q5lsfSnzBidMm8GWcRCTJkLQdvf6jjmqEDt8BcNB67WbPmIoEo21hk8mGqMRn8qjdO5KQuIvo+QRzi9TNWL/Qwj5lvUYAvGAivJpjz++odpOBd6Ml2HgJTXQ35CUCCg8zvynD3R6R7WDpQwYoliPG09jddatznky2vFjJO9MiTzTC/t5iwPcMcldvPAUeGRgklQ6A1GlziHr19N0w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_153917_643650_CC1C3EF5 
X-CRM114-Status: GOOD (  12.97  )
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

On Thu, 2023-10-26 at 21:56 +0000, Justin Stitt wrote:
> Add some warnings for using ethtool_sprintf() where a simple
> ethtool_puts() would suffice.
[]
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
[]
> @@ -7011,6 +7011,25 @@ sub process {
>  			     "Prefer strscpy, strscpy_pad, or __nonstring over strncpy - see:=
 https://github.com/KSPP/linux/issues/90\n" . $herecurr);
>  		}
> =20
> +# ethtool_sprintf uses that should likely be ethtool_puts
> +		if ($line =3D~ /\bethtool_sprintf\s*\(\s*$FuncArg\s*,\s*$FuncArg\s*\)/=
) {
> +			if(WARN("ETHTOOL_SPRINTF",
> +			   "Prefer ethtool_puts over ethtool_sprintf with only two arguments\=
n" . $herecurr) &&
> +         $fix) {
> +         $fixed[$fixlinenr] =3D~ s/ethtool_sprintf\s*\(/ethtool_puts\(/;
> +       }
> +		}
> +
> +		# use $rawline because $line loses %s via sanitization and thus we can=
't match against it.
> +		if ($rawline =3D~ /\bethtool_sprintf\s*\(\s*$FuncArg\s*,\s*\"\%s\"\s*,=
\s*$FuncArg\s*\)/) {
> +			if(WARN("ETHTOOL_SPRINTF",
> +			   "Prefer ethtool_puts over ethtool_sprintf with standalone \"%s\" s=
pecifier\n" . $herecurr) &&
> +         $fix) {
> +         $fixed[$fixlinenr] =3D~ s/ethtool_sprintf\s*\(\s*(.*?),.*?,(.*?=
)\)/ethtool_puts\($1,$2)/;

Thanks, but:

This fix wouldn't work if the first argument was itself a function
with multiple arguments.

And this is whitespace formatted incorrectly.

It:

o needs a space after if
o needs a space after the comma in the fix
o needs to use the appropriate amount and tabs for indentation
o needs alignment to open parentheses
o the backslashes are not required in the fix block

Do you want me to push what I wrote in the link below?
https://lore.kernel.org/lkml/7eec92d9e72d28e7b5202f41b02a383eb28ddd26.camel=
@perches.com/

> +       }
> +		}
> +
> +
>  # typecasts on min/max could be min_t/max_t
>  		if ($perl_version_ok &&
>  		    defined $stat &&
>=20


