Return-Path: <SRS0=9FsO=BR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F2FC433DF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 03:09:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9ACC120855
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Aug 2020 03:09:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iuSWUCDa";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="tHmAMAlh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9ACC120855
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=pTyahBizvczNP0TlOVbeHn1li5XEywnRNAE75v8OVfY=; b=iuSWUCDa3sbd/Lh0WCJbEKqIl
	YPV3m7QQL+p0r+//xdefPq58vSscBZ37+WSjumosnyXNnHa+B405LiPMTGlBO9gvMfFKTVxO0qiRF
	z83EhhC+HpWXrEMA067D5U075LT1n2rqzO6+4bj46vwRwOtVv3AHUHmaUIP64zMWSArxbH70WoJNm
	LpE0FkQwCg7lpT1KKIlzUIMVZqAm9au7mNnYQUFvqomQGlZ18iBpwNPMj26Gk6GWP6bTnrr3QtUVm
	4oawyzepycslHR5BszQGdK+E79rtwhrrqtzGhf4P+eJw8aakIvR1O64FkR5vuHwC9mMyk72puGeNR
	A2avttdoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k3sl4-0004Fi-1W; Fri, 07 Aug 2020 03:09:26 +0000
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k3sl1-0004Ex-J3
 for linux-mediatek@lists.infradead.org; Fri, 07 Aug 2020 03:09:24 +0000
Received: by mail-oo1-xc41.google.com with SMTP id g18so153201ooa.0
 for <linux-mediatek@lists.infradead.org>; Thu, 06 Aug 2020 20:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=U6N6/24JW1Y/fwXBodacBshH0kzzc0mjrkSIhSAOunI=;
 b=tHmAMAlhLR++RGcgqmMwLF46mP8giMmzW4D1mUiKGtdExH6GH+ypH27lMlGEP8MY8z
 AxlV7bL7pvqXGkfHsKJ29/sgUzIAvsTER0ZfCctrhGmzkOjYGxw50/O687X1jG/vWGsE
 Gzlrq+VtOwQQ8JJWdoeRFaJIQ41wYtmUb2/l8lxqeEqaIiDM/Aw+AENtNQQmICKv+XnA
 fSyzuIfdJTP2vgFjRRFrNRrCzruW3kdoy/XkwnymSmKR36gPR6oUuxmkmVorFWyybRqz
 Z1UvkvwkPWAyRp/TPnFCb5uD4w3riuTuC8Sv/msJQln9AES2Lgul1rg1vFz0kv9AiwXE
 Nceg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=U6N6/24JW1Y/fwXBodacBshH0kzzc0mjrkSIhSAOunI=;
 b=caRcZzZlXiWbLPvPblshaLuMYHz/PYFLSCMbdeiuspGKD5a9UggsRbV4lJ7rgQ8eB1
 RGonOg05kjsI6XxTg2ZooJHuixg0qRBIIhBN5OrRjNopu7c8kd+Vpt830UFwoNEY4AsA
 07J5XvPFh/+/7hduqUEyvaPfwbG63RjLK9HOhcTsesuKi49bPnAAaeWRcaJ+3v3OK82P
 jqNvuaC0nlLu4cy+MOPcu0sWfwt0yRDxktQWjLR+Vw/vKYEaLZSxcMEtIJaSVz77slZi
 AtUYW50ecAoo/NNYMabDTaqApF0oy9hM/9Ciwm87aWIvrptjEEV4PPBE/1/ZikrQPNxi
 P0Vg==
X-Gm-Message-State: AOAM531mNY41Y8orjuEf5GaH5e8JdsEWtFHTumnzNDOAwGHIMjHit5ii
 y805s/Q+ejy0uVjezvJCxL4rH0AuXuE/wK1OBUrJQg==
X-Google-Smtp-Source: ABdhPJziIq4CxdyB5vG+jRFUsHOHgL+P+hGyJHasj3L3ZJadah7L0e95Nkg0bjqc283OEZcDpuUPqtZE3AJU+sXVHmI=
X-Received: by 2002:a4a:ca11:: with SMTP id w17mr10792617ooq.88.1596769761749; 
 Thu, 06 Aug 2020 20:09:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200718000637.3632841-1-saravanak@google.com>
 <20200718000637.3632841-3-saravanak@google.com>
 <CALAqxLVZ+rFE+hM9OtQ46NqpTHeLu6oKLNWKstLv1U5zbwyq7g@mail.gmail.com>
 <CAGETcx_rkK3-bKhDP_N4n_WyXLXFPoaUV9rbY_Y+H1Joj=dCyw@mail.gmail.com>
 <f314b687-11a9-5a5e-e79e-c46dd2f16c6f@kali.org>
 <78ad0914-6173-f753-9eba-b7cbfbb51fd6@kali.org>
 <CALAqxLXPN9kThwF32YoWyApaWnfjthANXj3uk65Wc3ddaJQFFQ@mail.gmail.com>
 <20200807004001.GF20825@builder.lan>
 <CALAqxLWwY00PVUL7EM-tgbXeB5h8MsfPo7EFZTfDSzbb3P3eqQ@mail.gmail.com>
 <20200807013903.GG20825@builder.lan>
 <CALAqxLWmJisTA9836Rvb8f9m4hsTL7iZ=HQtz39anu2Bbgv44g@mail.gmail.com>
 <CAGETcx9Gsa9CWow8MBVPF4cgofdcK1+cFohAf_-Dqa3JT8H1bw@mail.gmail.com>
In-Reply-To: <CAGETcx9Gsa9CWow8MBVPF4cgofdcK1+cFohAf_-Dqa3JT8H1bw@mail.gmail.com>
From: John Stultz <john.stultz@linaro.org>
Date: Thu, 6 Aug 2020 20:09:10 -0700
Message-ID: <CALAqxLWR3mKrQDn5VkOV_zaaqxmwWzZwK0CCLRSfGJDU6WUXag@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] irqchip/qcom-pdc: Switch to using
 IRQCHIP_PLATFORM_DRIVER helper macros
To: Saravana Kannan <saravanak@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200806_230923_797352_DD0933C1 
X-CRM114-Status: GOOD (  18.11  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: CC Hwang <cc.hwang@mediatek.com>, Jason Cooper <jason@lakedaemon.net>,
 Marc Zyngier <maz@kernel.org>, Hanks Chen <hanks.chen@mediatek.com>,
 Loda Chou <loda.chou@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 Steev Klimaszewski <steev@kali.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Andy Gross <agross@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 Android Kernel Team <kernel-team@android.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Aug 6, 2020 at 8:02 PM Saravana Kannan <saravanak@google.com> wrote:
> On Thu, Aug 6, 2020 at 7:49 PM John Stultz <john.stultz@linaro.org> wrote:
> > On Thu, Aug 6, 2020 at 6:42 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > > With all due respect, that's your downstream kernel, the upstream kernel
> > > should not rely on luck, out-of-tree patches or kernel parameters.
> >
> > I agree that would be preferred. But kernel parameters are often there
> > for these sorts of cases where we can't always do the right thing.  As
> > for out-of-tree patches, broken things don't get fixed until
> > out-of-tree patches are developed and upstreamed, and I know Saravana
> > is doing exactly that, and I hope his fw_devlink work helps fix it so
> > the module loading is not just a matter of luck.
>
> Btw, the only downstream fw_devlink change is setting itto =on (vs
> =permissive in upstream).

I thought there was the clk_sync_state stuff as well?

> > Also I think Thierry's comments in the other thread today are also
> > good ideas for ways to better handle the optional dt link handling
> > (rather than using a timeout).
>
> Could you please give me a lore link to this thread? Just curious.

Sure: https://lore.kernel.org/lkml/20200806135251.GB3351349@ulmo/

thanks
-john

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
