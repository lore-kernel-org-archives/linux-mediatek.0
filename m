Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 068BCC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Feb 2022 05:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6dQDr+D4sV7mS2+FtKZePImVhuWGVoizG/nV4UX/jb8=; b=YV1+db/ZDXDvD+
	kAGAtCKD/mO//OaE8LP+lP4MYYkjF4vy0XD+TblERoIdp+aBeitni1VMRaLzvsX3tofYgcTSJ/5aN
	vudG6stLsJVedyZOgz4sdUgcUumT/lmYCGBSP4SURTU2eupmKIbCxMLnGULpwD/x75tbzA0H3PjAR
	dAQoLXRN446hrkfYi/BA5Bwj/XStvXpjKLbVP6o11LYsst35tmjlAFB0O2T4UHZt74Cs0C7ha/wj3
	ItP/3msP2Zt6H6fv+aCut3ghtL/5EPxjHf/llrXLDrm61EP81vDq2hJocjg1/iZ5CZlBPWUOCpFJr
	UYuh0C3U3/b9Uo8Tt00Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nHJQM-00CYyp-SA; Tue, 08 Feb 2022 05:52:22 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nHJQ3-00CYpW-FV; Tue, 08 Feb 2022 05:52:05 +0000
Received: by mail-pf1-x435.google.com with SMTP id d187so17032047pfa.10;
 Mon, 07 Feb 2022 21:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=ZLuzhS9mpAsa68IzrkcFELBJbuL/U6yaQdmHB+sIbmQ=;
 b=pJ5k9u7DsQhT4m3WLMULPqmPvLDCOPemnJy+LVyt6UblDhM3h+9ChipQWwkxML/qmL
 qIcROrJ1tGf4Rwd0i3idG0eGzmhkYgI4I8m/JlfHflITQnaDcv8+xbQdXM0gWTr3HpxK
 h1AkXmEHQOgpUjUaV0PsFuUMwCw6bkA0XMu2N6FfobRYE+VKAtyApH9Fv7jE4lGY+EOX
 byXzhqzEUVoxGJpFelZMOQp/SJ/nM6nFv7tc8eGcVLax9/silgoJJ7UXwczEhsMeyaZW
 8+TvU2SCcA0YwWXtI8pOEoQr0JhwKJ5UOXpvKdD6NtPbCrm7dFH5DJBqBhIGRW1RKqtk
 rqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=ZLuzhS9mpAsa68IzrkcFELBJbuL/U6yaQdmHB+sIbmQ=;
 b=T9WreQ+scU4FBNKa0RVPjUZLtYe90ubIHDBd+w2PRfPTyOO4X+RpCXDl1GiW2JSNfy
 ybKLrnGVHQP5uwBwS1stK3IdJlxLyMaATuudU1bPLfsMhtY8uEGTW+QWVe9R5ARqyw7x
 Ft64Si3OhSIFCPNt0I6wdtH3r6eijdtRlF6/yaJZZO5Xg1Fp865y0TTGhiC1IdTmauMQ
 C89PUx2lMELR+u9XnF60z/u6ZCLwtUb3+hJC7lbnseTWZN8y57IZp/xIlQgiVMaej5pU
 uW+TTJmFTs/tH54vL6fwhUndx1mUhXac8+bf+5FqPyR7rD2/GbJgDYx3MBiXmJ5UBnjl
 AUkQ==
X-Gm-Message-State: AOAM532FCN8MaTbfpS02IF/D47aYJc0ZWYNDa+ncTH88/wX3XYb+euGH
 bx+BQ+NSCFf1DKYGfsEMKqg=
X-Google-Smtp-Source: ABdhPJw/qE/ac6I/582HmyblUw3dJARRiZ5C8iGiN7CAokxqsV9kIAnmQMwIT5uMXuvibt0EYldZ0g==
X-Received: by 2002:a05:6a00:1709:: with SMTP id
 h9mr2786398pfc.23.1644299522547; 
 Mon, 07 Feb 2022 21:52:02 -0800 (PST)
Received: from google.com ([2620:15c:202:201:7164:d581:d7ee:53bb])
 by smtp.gmail.com with ESMTPSA id gb5sm1273066pjb.16.2022.02.07.21.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 21:52:01 -0800 (PST)
Date: Mon, 7 Feb 2022 21:51:59 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Fabien Parent <fparent@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/4] Input: mtk-pmic-keys - add support for MT6358
Message-ID: <YgIE/806gDmRJYCn@google.com>
References: <20220121140323.4080640-1-mkorpershoek@baylibre.com>
 <20220121140323.4080640-4-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220121140323.4080640-4-mkorpershoek@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220207_215203_550444_8A5E7795 
X-CRM114-Status: UNSURE (   9.37  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 21, 2022 at 03:03:22PM +0100, Mattijs Korpershoek wrote:
> MT6358 pmic keys behave differently than mt6397 and mt6323: there are
> two interrupts per key: one for press, the other one for release (_r)
> 
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>

Applied, thank you.

-- 
Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
