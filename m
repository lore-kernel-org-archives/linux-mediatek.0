Return-Path: <SRS0=XFYx=2G=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23E54C43603
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 10:30:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE8AA206CB
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Dec 2019 10:30:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iBwsj0SI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xl1BOaEV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE8AA206CB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LhlrjryO/I7A/yxpT9Nzzh/mN3cDL6RFUsJQRK3F5uU=; b=iBwsj0SIJUr5k7
	/b5ikD3hGW6AlRzD+KBpGD6GnTTZ0SnZ6o5w0Wu4v35h333ZD5zyedUGk2/KgKMGmN/eYnjrPWIBF
	TBT/Qmdc7rDF8rBpdymaZ62MBx3JOyzfGttk2jRC2LSxxKFdf+XIWnjq2D8QuMT6RJkxE63nnY42X
	fwIibQoNvyWeMsCZTB7SFGUQEQNLkhfAziIAVRNCy05P70u5Hjen2TkbJdsFgihhVdjMO1tcR/srd
	2kos2KFXan6SbeQwTUxEvDJzvbuk78E939NMxATr60gxiSt9h7+yJ+6NJTrrstAoqdJZgXf9dga8l
	0jsJRo5mRJfF9MJksTfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1igneA-0007iF-7M; Mon, 16 Dec 2019 10:30:38 +0000
Received: from mail-qv1-xf41.google.com ([2607:f8b0:4864:20::f41])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1igndt-0007Oe-0R
 for linux-mediatek@lists.infradead.org; Mon, 16 Dec 2019 10:30:22 +0000
Received: by mail-qv1-xf41.google.com with SMTP id f16so307691qvi.4
 for <linux-mediatek@lists.infradead.org>; Mon, 16 Dec 2019 02:30:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cN9P/BG2n4fcm/c0k1+snwpKHQ7N7T0aPKvvgLtAhis=;
 b=Xl1BOaEVQnzWV9uNsZideZioGq+xYE5SBa6N051vdtEL+5gUndFQSj8rnNn8EwGyk5
 FsXetpn7+FazhrzlflKmIkol7p7Y3kL+FkC0rppFLYmDptwQytz4ZavTf9g/RQIf/ytH
 f5rqQXe4iVUBMn8deEBMuPKHDYomsCko+sga0mEIcrpvKdOjZKvi5aPJFkVW1ytNv7iG
 VQhutYCAAF4/0ZXd8N9It7vlFVNM8+W2c6qQks5rsqCoLnxQ5Lxvicn7BRI197wTNTDy
 Ow4q2LBuxD6NzpJnF+IrHNKqLeoTZF5Rxq4Ar7l3RfkQ7ZSusbwFP76fIpnuAuNE/m9X
 /r+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cN9P/BG2n4fcm/c0k1+snwpKHQ7N7T0aPKvvgLtAhis=;
 b=Zd60dteRNUIAxBGrIdSQAQwlErN2zbMjciEsdWpgLEaDmzqwRSQoQXKSlrJuc1xl+8
 vnl0sQgOBmVeActAZ/hlTxFksY1ASc8J2Brv8pCu1XiR+5zU54U2M81KBYcG62Vsh03t
 agdQ36m5JUtTTazMZp18ZpvH2oLtVWIXZpEBKUsV6vUDyL1Iqf0FBmeRIXgP2AnM2e8W
 oiSPOrMeLn2d71OxmAhztvUWcmra+Qi/wNYAH4JRgRnhue+jaoCdkU5Xo2LFfSq6leIK
 3WXylF+ugzZwQprrP+4JxVzS8n5gO3Qn1j6qy3eZrTPpR39KnJHbBkPrFpt3EHzsReDf
 F2Jg==
X-Gm-Message-State: APjAAAWbeycc7iH0w1veGCA4eSTGryXdcGbjTIL8E5f9oMD5sT7rC8IK
 WbzKlZqhxjiR/BScAilmHzzIkIfK7BGtMw9vBRs=
X-Google-Smtp-Source: APXvYqx/dlytxqrLzbst7Hqk/D1zbEebOmGJKkioZFuGnnZ+zEpu4pRIb7CWgM6duHC0DYQ/wRStwgD3vFlt7l4uOTI=
X-Received: by 2002:a0c:c24f:: with SMTP id w15mr26533823qvh.66.1576492218033; 
 Mon, 16 Dec 2019 02:30:18 -0800 (PST)
MIME-Version: 1.0
References: <20191213095215.17068-1-jitao.shi@mediatek.com>
 <CAJMQK-iZq0SRR7Q1cyh033xDXwD+MY-utO05+KqFR=ZRuaVUDg@mail.gmail.com>
In-Reply-To: <CAJMQK-iZq0SRR7Q1cyh033xDXwD+MY-utO05+KqFR=ZRuaVUDg@mail.gmail.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Mon, 16 Dec 2019 11:30:06 +0100
Message-ID: <CAFqH_5209EaEzoPBHGM=GiS+v7znZR-XzvQ5L_ThQhhuGc1bXg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: reduce the hbp and hfp for phy timing
To: Hsin-Yi Wang <hsinyi@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_023021_089610_2849625B 
X-CRM114-Status: GOOD (  12.42  )
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
Cc: Jitao Shi <jitao.shi@mediatek.com>, Daniel Vetter <daniel@ffwll.ch>,
 srv_heupstream <srv_heupstream@mediatek.com>, David Airlie <airlied@linux.ie>,
 stonea168@163.com, cawa cheng <cawa.cheng@mediatek.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, CK Hu <ck.hu@mediatek.com>,
 sj.huang@mediatek.com,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Bibby Hsieh <bibby.hsieh@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yingjoe Chen <yingjoe.chen@mediatek.com>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi all,

Missatge de Hsin-Yi Wang <hsinyi@chromium.org> del dia dl., 16 de des.
2019 a les 3:42:
>
> On Fri, Dec 13, 2019 at 9:52 AM Jitao Shi <jitao.shi@mediatek.com> wrote:
> >
> > There are some extra data transfer in dsi.
> > ex. LPX, hs_prepare, hs_zero, hs_exit and the sof/eof of dsi packet.
> > This signal will enlarge the line time. So the real frame on dsi bus
> > will be lower than calc by video timing.
> >
> > So dsi driver reduces the hbp and hfp to keep the line time.
> >

This patch not only reduces the hbp and hfp for phy timing, it also
fixes an actual issue for MT8173 boards (i.e. Acer Chromebook R 13)
which is that the display is not working anymore (black screen) after
7a5bc4e22ecfd74dc3662342beaa909770a3b786 "drm/mediatek: change the dsi
phytiming calculate method". So the patch is probably missing a:

Fixes: 7a5bc4e22ecf ("drm/mediatek: change the dsi phytiming calculate method")

And would be nice to have this patch applied for 5.5

> > Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Tested-by: Hsin-Yi Wang <hsinyi@chromium.org>

If it helps, you can also add my

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

Thanks,
 Enric

> > ---
>
> Tested on mt8183 and mt8173
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
