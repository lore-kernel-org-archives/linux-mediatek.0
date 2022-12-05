Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D427BC4321E
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 12:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MIB3xvxCZJU4GWFyhSO9TpaK2tmBFBEo8wuA140FSA=; b=itqNjyFrTCQjpjxX4q3h1QEJZk
	PiVix2jCEthXdRWra7I2Wh1MPppcc5t051ssUF3S/LhwojOpeSTyhphRikBLxyhIKIvvF+jb6xuvD
	pH6SRdicZCzyyKODNKVHwGugOXP8udppUZBJG9z0sSgeAtC3CjQgWuF3nAMxG9AIboxdp7UCTLG4i
	MF67h1cd/7hiTpQvGE+VQ92mWYiJHjVQUnH1F5mumyFKQ5WtSKccPcY4njwgaN45pPQ7gCNx59hVf
	eB9xzpxXdUM/rkwFmvVtI+72unW7BOFWgtkqIe62pFf0uzI+N6DVjkaGghOf1PCTKjBwNaY14SqcQ
	yWUYG7HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2AHc-002QIB-QB; Mon, 05 Dec 2022 12:09:16 +0000
Received: from mail-qk1-f175.google.com ([209.85.222.175])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2AHQ-002Q3M-BO; Mon, 05 Dec 2022 12:09:05 +0000
Received: by mail-qk1-f175.google.com with SMTP id g10so4732480qkl.6;
        Mon, 05 Dec 2022 04:09:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6MIB3xvxCZJU4GWFyhSO9TpaK2tmBFBEo8wuA140FSA=;
        b=gCb2rm1+hRtrxmx4CuAtT7QPRGc0UknjPPjH6wETl5qfBI1ZSqbbtn+jbmi0FoUPB6
         +bFg9/0sRA0qMpVTWdKbMMWCW8w3IHbxh9lVVshBzyIqZuCTrmZMzJgfPVK0lhIymagu
         uRYi/hWflYQdCMdguhLH6ekcxGJc2q9hKJm6UI17A3fWODD8ZY/hraMTOo5iQmU2cgwT
         7gQ7HyhFMS5jG6rMjbFXdVUpnHJ+/h42VKQAqqxiPxXaL5NdVwWqdc9SpNWVEqoTMnPu
         c/wk/q10pDXO0jDc8B8VukYWxflXEpHC4gMaXp1+RimLhHe7A79CF/Y6HAJF6F6E/B1T
         DjyA==
X-Gm-Message-State: ANoB5pnzdBk28zSUPeZLRaW7wVD8P0RJ4Ew1MqECB5yPJYdLiRmKFpTV
	sUeFkmXpd+TGhEu7PeldVIiGOB/twDrMjAzM1dg=
X-Google-Smtp-Source: AA0mqf7FMTmERIGbZY2w/Q82ozUpwVdcf9Crh6uuy78ifwFCCa0OM9jDIT99xZgX8z/1kHUGB4tv5EJTfgsWNfg0mHM=
X-Received: by 2002:a05:620a:4611:b0:6fa:af7e:927c with SMTP id
 br17-20020a05620a461100b006faaf7e927cmr71338620qkb.443.1670242142398; Mon, 05
 Dec 2022 04:09:02 -0800 (PST)
MIME-Version: 1.0
References: <930778a1-5e8b-6df6-3276-42dcdadaf682@systemli.org>
 <18947e09733a17935af9a123ccf9b6e92faeaf9b.1669958641.git.viresh.kumar@linaro.org>
 <CAJZ5v0ixHocQbu6-zs3dMDsiw8vdPyv=8Re7N4kUckeGkLhUzg@mail.gmail.com>
 <CAJZ5v0hc8CsvqLKxi5iRq7iR0bkt25dRnLBd23mx-zdi2Sjgsw@mail.gmail.com> <20221205043044.bgecubnw7d3xlyi5@vireshk-i7>
In-Reply-To: <20221205043044.bgecubnw7d3xlyi5@vireshk-i7>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Mon, 5 Dec 2022 13:08:47 +0100
Message-ID: <CAJZ5v0gTV5LM_qRKncPq5Z2TRENMgVer6oZiGAKJn6ndrNSKxg@mail.gmail.com>
Subject: Re: [PATCH] Revert "cpufreq: mediatek: Refine mtk_cpufreq_voltage_tracking()"
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org, 
	Vincent Guittot <vincent.guittot@linaro.org>, regressions@leemhuis.info, 
	daniel@makrotopia.org, thomas.huehn@hs-nordhausen.de, 
	"v5 . 19+" <stable@vger.kernel.org>, Nick <vincent@systemli.org>, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_040904_410635_634CA313 
X-CRM114-Status: GOOD (  13.48  )
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

On Mon, Dec 5, 2022 at 5:30 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
>
> On 02-12-22, 20:46, Rafael J. Wysocki wrote:
> > On Fri, Dec 2, 2022 at 1:17 PM Rafael J. Wysocki <rafael@kernel.org> wrote:
> > >
> > > On Fri, Dec 2, 2022 at 6:26 AM Viresh Kumar <viresh.kumar@linaro.org> wrote:
> > > >
> > > > This reverts commit 6a17b3876bc8303612d7ad59ecf7cbc0db418bcd.
> > > >
> > > > This commit caused regression on Banana Pi R64 (MT7622), revert until
> > > > the problem is identified and fixed properly.
> > > >
> > > > Link: https://lore.kernel.org/all/930778a1-5e8b-6df6-3276-42dcdadaf682@systemli.org/
> > > > Cc: v5.19+ <stable@vger.kernel.org> # v5.19+
> > > > Reported-by: Nick <vincent@systemli.org>
> > > > Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
> > >
> > > Do you want me to push this revert for -rc8?
>
> No, I was planning to make it part of my pull request.

Well, this was a bit unclear.

> > After all, I've decided to queue it up for 6.2, thanks!
>
> Can you please drop that ? AngeloGioacchino already reported that
> Reverting the proposed commit will make MT8183 unstable.

OK, dropped now.

> So the right thing to do now is apply the fix, which is on the list
> and getting tested.

Alright then, I'll assume that the proper fix will come in through
your pull request for 6.2 (but please send that one before the merge
window opens), thanks!

