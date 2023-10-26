Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5820C25B6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Oct 2023 22:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dxV0z/KJX2jAtAYojUd4aHcjxi+u31o0EAgu6F7IwM=; b=ZI/M55SkDOc9U8MYnM5JOCPRjv
	rna4S521nh1VOyusZWsbJu92kR0mW00x+GZJF7/lR9LM79tUnGRHJkL1SuVvi4faLRhPoEGSAtohK
	Ss8bniFdetpByW4rAY9R8NBTx+T90dlUWUzFD2NOxH8Xiw4tgHPIPBySQOjBmeM6ZxmOXCxvOFoeD
	M+WeN08s2wannJzfb05RhuiltXLkKaP/boRYjCMXbQ4Af4vSTBKQoTdLjrBKHsDhLmV0oy1NeBSRA
	ynK1Jx184iItux6rIKr8sqlRgKYmDI5ti65+uIgE6kKympaiHhpNLbKqabNBfVtC6mXjhkz5TX86B
	sHJj2imA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qw8aR-00FEUj-1t;
	Thu, 26 Oct 2023 22:12:19 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qw8aM-00FETM-2I;
	Thu, 26 Oct 2023 22:12:16 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-32caaa1c493so950954f8f.3;
        Thu, 26 Oct 2023 15:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698358331; x=1698963131; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9dxV0z/KJX2jAtAYojUd4aHcjxi+u31o0EAgu6F7IwM=;
        b=bkypPKcSLTQB3+pwu23ywF/qEP/r33ei6+urmmg5NBxQo3R0EQuq8b8DfND5X7iLrZ
         vnkUxIbev7N/AlEH/W1Tmwj3qpPRMyWtvuoHnh64lvPSqIjvZ5bmGApi9giK03wF4PIS
         KqyAaZgmeBre2247/tnjU6EbF6XCugvIgSDKODkyKTmeBCLQHNwPrPtVBs751eNSoyId
         DgfufP3kT0FOymllmlGwUX1IjI5iSNzlic1VhojDR/I/k6GpU7QXmNBbCThACvmjWEbZ
         I0TfSmC7odOakWYRGMSAArfmTAPB4FHD8PtIb3WahopPdxE4UkORwC98veMq83OkkPrC
         +2VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698358331; x=1698963131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dxV0z/KJX2jAtAYojUd4aHcjxi+u31o0EAgu6F7IwM=;
        b=ZV3TB4bSdwTcDbldalEMHJIYLSOfBeOYaDeTs1wQX1pz5cYJcDBWt0uy2GYPBiobyO
         TnYureChmr0ZgUqZfrDaxNmTfP7nbTMwOegDel+7fSPcIAKOzP+qDRTDDKLDdZhbE+r6
         v9jnmFNCLIa11TktK91QvWAEhuLNx4K4juaZ/+yYevYKKzMoXRpF+TToiy5WZnQH2Ync
         lshd0N4UKBp7hZ0nVja4729QQ1DywqO5w9If9yuH+L0g0xo53twwmEa3EXxi9jOx349N
         6UDkMwDRQ+FEXJ+qHL3Fq0sG0k+BbczTl/701ZwmBHi3tVRQhBzaoRN8jNnQzynbpAiu
         Eb/w==
X-Gm-Message-State: AOJu0YwKmtIsgMsY8ux5XXq+eBTUPUPtdYilQbkdrlN2Ci/N3hobwNhe
	0T0HEPOp+Sa02iHOueevbLs=
X-Google-Smtp-Source: AGHT+IEFBkpZiWpPOgBWSz7VhB+L8HEH65ute3OKtRNDPYBqco6PY6IhRvs9olvc+3J8je+BIT3EsA==
X-Received: by 2002:a5d:5a06:0:b0:32d:a101:689d with SMTP id bq6-20020a5d5a06000000b0032da101689dmr886013wrb.56.1698358330949;
        Thu, 26 Oct 2023 15:12:10 -0700 (PDT)
Received: from skbuf ([188.26.57.160])
        by smtp.gmail.com with ESMTPSA id d16-20020adfef90000000b0032326908972sm358008wro.17.2023.10.26.15.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Oct 2023 15:12:10 -0700 (PDT)
Date: Fri, 27 Oct 2023 01:12:06 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Justin Stitt <justinstitt@google.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Shay Agroskin <shayagr@amazon.com>,
	Arthur Kiyanovski <akiyano@amazon.com>,
	David Arinzon <darinzon@amazon.com>, Noam Dagan <ndagan@amazon.com>,
	Saeed Bishara <saeedb@amazon.com>, Rasesh Mody <rmody@marvell.com>,
	Sudarsana Kalluru <skalluru@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com,
	Dimitris Michailidis <dmichail@fungible.com>,
	Yisen Zhuang <yisen.zhuang@huawei.com>,
	Salil Mehta <salil.mehta@huawei.com>,
	Jesse Brandeburg <jesse.brandeburg@intel.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Louis Peens <louis.peens@corigine.com>,
	Shannon Nelson <shannon.nelson@amd.com>,
	Brett Creeley <brett.creeley@amd.com>, drivers@pensando.io,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Wei Liu <wei.liu@kernel.org>, Dexuan Cui <decui@microsoft.com>,
	Ronak Doshi <doshir@vmware.com>,
	VMware PV-Drivers Reviewers <pv-drivers@vmware.com>,
	Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Hauke Mehrtens <hauke@hauke-m.de>, Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	=?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Wei Fang <wei.fang@nxp.com>, Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Jiawen Wu <jiawenwu@trustnetic.com>,
	Mengyuan Lou <mengyuanlou@net-swift.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <keescook@chromium.org>, intel-wired-lan@lists.osuosl.org,
	oss-drivers@corigine.com, linux-hyperv@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, bpf@vger.kernel.org
Subject: Re: [PATCH next v2 2/3] checkpatch: add ethtool_sprintf rules
Message-ID: <20231026221206.52oge3a5w4uxkkd5@skbuf>
References: <20231026-ethtool_puts_impl-v2-0-0d67cbdd0538@google.com>
 <20231026-ethtool_puts_impl-v2-0-0d67cbdd0538@google.com>
 <20231026-ethtool_puts_impl-v2-2-0d67cbdd0538@google.com>
 <20231026-ethtool_puts_impl-v2-2-0d67cbdd0538@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231026-ethtool_puts_impl-v2-2-0d67cbdd0538@google.com>
 <20231026-ethtool_puts_impl-v2-2-0d67cbdd0538@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_151214_769016_FA32C7A9 
X-CRM114-Status: GOOD (  20.87  )
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

On Thu, Oct 26, 2023 at 09:56:08PM +0000, Justin Stitt wrote:
> Add some warnings for using ethtool_sprintf() where a simple
> ethtool_puts() would suffice.
> 
> The two cases are:
> 
> 1) Use ethtool_sprintf() with just two arguments:
> |       ethtool_sprintf(&data, driver[i].name);
> or
> 2) Use ethtool_sprintf() with a standalone "%s" fmt string:
> |       ethtool_sprintf(&data, "%s", driver[i].name);
> 
> The former may cause -Wformat-security warnings while the latter is just
> not preferred. Both are safely in the category of warnings, not errors.
> 
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
>  scripts/checkpatch.pl | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 25fdb7fda112..22f007131337 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -7011,6 +7011,25 @@ sub process {
>  			     "Prefer strscpy, strscpy_pad, or __nonstring over strncpy - see: https://github.com/KSPP/linux/issues/90\n" . $herecurr);
>  		}
>  
> +# ethtool_sprintf uses that should likely be ethtool_puts
> +		if ($line =~ /\bethtool_sprintf\s*\(\s*$FuncArg\s*,\s*$FuncArg\s*\)/) {
> +			if(WARN("ETHTOOL_SPRINTF",
> +			   "Prefer ethtool_puts over ethtool_sprintf with only two arguments\n" . $herecurr) &&
> +         $fix) {
> +         $fixed[$fixlinenr] =~ s/ethtool_sprintf\s*\(/ethtool_puts\(/;
> +       }
> +		}
> +
> +		# use $rawline because $line loses %s via sanitization and thus we can't match against it.
> +		if ($rawline =~ /\bethtool_sprintf\s*\(\s*$FuncArg\s*,\s*\"\%s\"\s*,\s*$FuncArg\s*\)/) {
> +			if(WARN("ETHTOOL_SPRINTF",
> +			   "Prefer ethtool_puts over ethtool_sprintf with standalone \"%s\" specifier\n" . $herecurr) &&
> +         $fix) {
> +         $fixed[$fixlinenr] =~ s/ethtool_sprintf\s*\(\s*(.*?),.*?,(.*?)\)/ethtool_puts\($1,$2)/;
> +       }
> +		}
> +
> +
>  # typecasts on min/max could be min_t/max_t
>  		if ($perl_version_ok &&
>  		    defined $stat &&
> 
> -- 
> 2.42.0.820.g83a721a137-goog
> 

I don't really know Perl, but does the indentation and coding style here
conform to any rules, or is it just free-form? The rest of the script
looks almost as you'd expect from C. This is unreadable to me.

