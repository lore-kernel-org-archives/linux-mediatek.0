Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC39C433EF
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Mar 2022 23:02:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V1cRtVP3877Iy1gwHMgnXBv6DPqfo3IVb6+MdEumiRA=; b=0QFoPoA6SGpImm
	ReYIpOq0KzTrJAVfxqxqavWE3EWp6PWbbcR6f93j7tumskX9eCiYgXxvmpP3ELu0/htdWjDKO/5Lr
	6UEqCYCyGOpS3lT8Fgk5nUbK7ON/1q6rjSwuNvtkIxpopAiS3Bv32tzr3D6mijDw2NukFrxCcJaVX
	1O8izxRmNQZGNNSloLN98N/RK+q7JVJeB+jyWmMbLoj0d6FDfyk4co/jjyq+G82sj5CdG4jzO374/
	pecL6bizE7x2ebwF440g4hoW8Ol6CrIebBivJeqYQBxiAph4lKT+rcIDjHSRAP8csRqikZU25I3Pz
	UXj9uKLAB2yodKIVU0og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nQdPz-00DxCv-Vd; Sat, 05 Mar 2022 23:02:31 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nQdPn-00DxA8-H1; Sat, 05 Mar 2022 23:02:20 +0000
Received: by mail-pf1-x42a.google.com with SMTP id z16so10658809pfh.3;
 Sat, 05 Mar 2022 15:02:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=H61iKhkd64ivVWZs4ogkCt+4zOe3n7k0C4BO+obH/mo=;
 b=oVpS998rFH1VqSDBjKnjKcPMllHyCS3K3Ph9n50E+XyAod2UbvQwteRIATesRUC9im
 ds3k6fjaX2eKog4QA+B5EDlqdTNUhRwLy+dtd1vXdKdW0rIdz+oX6QczEAK9Gl2fqHmD
 6XgzpgYhSvPC9k1CQvtObhojOyAexTBM0gx9cCndbxaCAdiDWQzDgHDBUvrbojJCvXcC
 4QaTbaw4ppPQm9lG+Trr4ZAjXjm2wRJmmbAsTpQjDg/imJf4x6yi3/MhmK9+aTuBc+lt
 QcxndxHVv3oN0NUppe+Plsj1ESaCgwWpplH4cVm2dNvXKyH944snuvVyfnu2U4b7kfwU
 Ht+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=H61iKhkd64ivVWZs4ogkCt+4zOe3n7k0C4BO+obH/mo=;
 b=mWyBoKl8wwLAtq84K5Oj2CKwtwKGGDJInxhjjvaMU5qb7l6IuNA+DYF4ZadizQw4dM
 lhuVBDnRURa0SGP026838hzGJ2rQN/JFLJEcFb6OhLG2O7405YrVmBPSnuA9Mk6X0PB5
 8+B+u9gTvB9kZPikLbmyK8K/iUdOjWczbetc0mT0BrxODoeHjoAMKYH6aJB/B54LQfW3
 2EVmrrAUPVEV2et9HakFbF3Je1iP2yJlhJPzdrfqTcU/H3zoScMAv7mYeBLc4lP8bpRH
 EOcz8vZl3I0+Pwu85N1ux71pm7n2G1TgWkK2I5UALlAFp3/F5cTSjEdxaogPXkevLvxn
 S9QA==
X-Gm-Message-State: AOAM532Z7VGRZixj7yZ2ZFxkq07R4ZufRGzjIjxlTnWJin/QsO25hxr2
 hO56FhusKln/CTvWtNaKZY0=
X-Google-Smtp-Source: ABdhPJy1m1vQ4DLxM3tBBx4rnn38jnYJj6bd6yxYjnKZJ93DMvmYDLcwYcjrcnlLo6Xtt/8vsRbTXQ==
X-Received: by 2002:a62:55c4:0:b0:4f6:b396:9caa with SMTP id
 j187-20020a6255c4000000b004f6b3969caamr5998502pfb.19.1646521337975; 
 Sat, 05 Mar 2022 15:02:17 -0800 (PST)
Received: from google.com ([2620:15c:202:201:15af:5d15:3044:acb9])
 by smtp.gmail.com with ESMTPSA id
 v7-20020a637a07000000b0037c9268a310sm5335983pgc.3.2022.03.05.15.02.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 05 Mar 2022 15:02:16 -0800 (PST)
Date: Sat, 5 Mar 2022 15:02:13 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Mattijs Korpershoek <mkorpershoek@baylibre.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Marco Felsch <m.felsch@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Fengping Yu <fengping.yu@mediatek.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 Fabien Parent <fparent@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>, linux-input@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v21 1/3] dt-bindings: input: Add bindings for Mediatek
 matrix keypad
Message-ID: <YiPr9Zt+VA3NbI+Q@google.com>
References: <20220303154302.252041-1-mkorpershoek@baylibre.com>
 <20220303154302.252041-2-mkorpershoek@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220303154302.252041-2-mkorpershoek@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220305_150219_621630_C344679B 
X-CRM114-Status: UNSURE (   8.54  )
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

On Thu, Mar 03, 2022 at 04:43:00PM +0100, Mattijs Korpershoek wrote:
> From: "fengping.yu" <fengping.yu@mediatek.com>
> 
> This patch add devicetree bindings for Mediatek matrix keypad driver.
> 
> Signed-off-by: fengping.yu <fengping.yu@mediatek.com>
> Reviewed-by: Marco Felsch <m.felsch@pengutronix.de>
> Signed-off-by: Mattijs Korpershoek <mkorpershoek@baylibre.com>
> Reviewed-by: Rob Herring <robh@kernel.org>

Applied, thank you.

-- 
Dmitry

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
