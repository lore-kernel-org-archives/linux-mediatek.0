Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 084E2C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 06:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o9ZLCf6H5zMibGLji/ZrEr4Dnp3pwD4KiKgoTIyCHfg=; b=mgUt7fToHcV2lF
	+xUjfyGOSnF40OLqlxUoKLhCYvem0WkYwd9cH7FX0wmWRUuo6/HFmuk9GYvPy3AtNcTKobtTVz9Mg
	mLzkufJ3u05bimgLdRsPwNs48UPVYGgb3Cdb0g7OqlNO0ddkEqVCyu8kC8x4cVEaIOo4gPWsHBaI3
	rZgjfXvqbAtj4tGlz15kq8jkP7hQIBrrzq1iKieQ0T8xPfPOEndD/krfVMu1V67YH+tMgGg+8mN0P
	2h8sRy9tDz+kBUo2QV9VupT5NiefIEM5Ldj4zi688lOU3xtSyhIPfB2zr/FlfmDRnS7yQ8raQlXHD
	5OBLlHSpJ9exWLvsJEzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mq8Df-006VCM-JE; Thu, 25 Nov 2021 06:26:55 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mq8DT-006VAr-N9
 for linux-mediatek@lists.infradead.org; Thu, 25 Nov 2021 06:26:44 +0000
Received: by mail-pf1-x434.google.com with SMTP id i12so4963111pfd.6
 for <linux-mediatek@lists.infradead.org>; Wed, 24 Nov 2021 22:26:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=3KRVplZvCkFOfOVdJLJgvxv7eUeJSjbE0R2ZMjgK8Fg=;
 b=qg7NUJu8MPy9axIndKBSZG/A9a117Qks+SvprKKIx/6u5Dvo/wfW0dxXbnZkcYB28o
 5B17LrKsuz/lmmXBBKRG1orqyFioG0onD0PqUjHrRQL2hHgz3PwlzwxqosZ3wLqzkj95
 UFuYnqXqUObbeHSfCMVySNCroM4b3vD5tROZ069p2SjZyi8C7muv2zb9cvBIyErJBLIf
 7yfIgTo4lBszagYEVQnQN7ArIulNHpavFKtGJAway+kSQ+jAAGPVPNJIYzhBBO3ug9dh
 jt0oPZLzO/XbNsOClyXigay8drAl7EgarlADNCKFMrujlcfFlrXL2QaRS/Wl9NC1qKdr
 qCgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=3KRVplZvCkFOfOVdJLJgvxv7eUeJSjbE0R2ZMjgK8Fg=;
 b=4rOkLumNlTjVCSY/JQ5CN4aSOJDH7jGCVZ26lGH0c60SpF4TDpKl56zPgRrZt345yf
 p4KM/PJ08wkTyXoOWJMLf/oWhyCawcZtCrPZ2ESJIHGHxiq8uWEcSJOI4OXGlUIjDaax
 f9YpCY0rM6QbuF4DBWXrQkZ7sELUPKFcYF7HS/5FCYogTf0bk200cGrDmFnEYALsbdRF
 xUB5CJDvmymjolL0e+BxCNDqCRK25BDwPBQNFlNj7ROYQHlrFtberG18+mGDbk4N6QEj
 PpmK0ll0Wp9F7O+N6Bp13wx2p8P0iLrvalNREN+CKDOsFYmtD84Ju4oighlfUA6qr7wo
 2v7g==
X-Gm-Message-State: AOAM5334OhaCgYcVnlrHYYPzr29G1OKLNb4HTQjyBw7K1nmqcWQjn6iS
 sDlDkHdRnjlcRUrLN1+yaPKEFQ==
X-Google-Smtp-Source: ABdhPJxroYaq42S+P8YT4URm9RJBoYTh6XWDOXusK9S3jNhc0+OPin92kb/rtWyJBd7dnKPLjtIrIg==
X-Received: by 2002:a63:155d:: with SMTP id 29mr14353211pgv.302.1637821602409; 
 Wed, 24 Nov 2021 22:26:42 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:cd6a:1959:1c65:cc19])
 by smtp.gmail.com with ESMTPSA id o23sm1706196pfp.209.2021.11.24.22.26.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 22:26:42 -0800 (PST)
Date: Thu, 25 Nov 2021 14:26:37 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux-ALSA <alsa-devel@alsa-project.org>, cujomalainey@google.com,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 sound-open-firmware@alsa-project.org
Subject: Re: [PATCH v3 3/3] firmware: mediatek: add adsp ipc protocol interface
Message-ID: <YZ8snZR/KHLDhIlf@google.com>
References: <20211124084514.28002-1-allen-kh.cheng@mediatek.com>
 <20211124084514.28002-4-allen-kh.cheng@mediatek.com>
 <YZ4TGvtwO5ySCEkT@google.com>
 <43976e8aab2e3055195d8e9c2f466a804e4d2ba7.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <43976e8aab2e3055195d8e9c2f466a804e4d2ba7.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_222643_769083_2D9DC215 
X-CRM114-Status: GOOD (  17.33  )
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

On Thu, Nov 25, 2021 at 09:47:22AM +0800, allen-kh.cheng wrote:
> On Wed, 2021-11-24 at 18:25 +0800, Tzung-Bi Shih wrote:
> > On Wed, Nov 24, 2021 at 04:45:14PM +0800, allen-kh.cheng wrote:
> > > +	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
> > > +		chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
> > > +		if (!chan_name)
> > > +			return -ENOMEM;
> > > +
> > > +		dsp_chan = &dsp_ipc->chans[i];
> > > +		cl = &dsp_chan->cl;
> > > +		cl->dev = dev->parent;
> > > +		cl->tx_block = false;
> > > +		cl->knows_txdone = false;
> > > +		cl->tx_prepare = NULL;
> > > +		cl->rx_callback = adsp_ipc_recv;
> > > +
> > > +		dsp_chan->ipc = dsp_ipc;
> > > +		dsp_chan->idx = i;
> > > +		dsp_chan->ch = mbox_request_channel_byname(cl,
> > > chan_name);
> > > +		if (IS_ERR(dsp_chan->ch)) {
> > > +			ret = PTR_ERR(dsp_chan->ch);
> > > +			if (ret != -EPROBE_DEFER)
> > > +				dev_err(dev, "Failed to request mbox
> > > chan %d ret %d\n",
> > > +					i, ret);
> > 
> > If ret == -EPROBE_DEFER, wouldn't it need to return
> > -EPROBE_DEFER?  It doesn't retry later if -EPROBE_DEFER.
> 
> If ret != -EPROBE_DEFER, it will show a error message then goto out.
> 
> If ret == -EPROBE_DEFER, probe funcation also will goto out. 
> 
> 
> Both of them will return ret. will not go to next round.

I see.  I misunderstood.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
