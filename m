Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7366BCCA468
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Sep 2025 13:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U7X/b1Kbs5OCvRU0GBpntLuEMIQcaq4SlMHIgv5+ST4=; b=X0XTfQ9eAeB1wEpPbc2Nnzqnaz
	ckF9/YEtMTY9Qr1mZJAYHY0xA02EMX86B6EWITqtHwItf1NyMS6SmlpK1yXgV8AaipCw4QkvQO1Xp
	Pj9bFvM2esBN1ThDvkgQtnT4xd0O9P4JysF6skhsa7Rjs+yU62rfy7s28HwnUqdaTPdMrKVfk5tAM
	NCDOx+vCltl0iORqaaTXrvsIJLrck2zVgkXhjBhvhJVRxZwm5nRYx5FlE17mR3hR4eOGVJSR1hR/6
	IJwdnVYPr05pxj2ASSn6IpngPVsts0QHY8tl5xRNXNkOzYj5RrYbpZrlSQJzd7Y/RA3tWstjgT+k4
	RQoeiu+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3aM7-00000005OmW-45mj;
	Tue, 30 Sep 2025 13:25:23 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3aM5-00000005Om7-2IAv
	for linux-mediatek@lists.infradead.org;
	Tue, 30 Sep 2025 13:25:23 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=qivYXUEEFj7b7SIOlhejGNwgLpoK3eQCbNHkHgd5BQXipC1Wp6okP8m+8sZS5HvFZOp65ETSuViqfkMDyA+YpJR/lrWMTVJfNt1KdWB2NAv3dkgzrc3LGudyNcMR5HeMUhniNt8akchwBsXEkgwf6pl8qYb6LZ5T/j65Y0zwvRjnTFCEZK1DSRO1wSr4P9f/+ZnzbANDaO1tmp+arvOeUQ3thDHce1IFmU3Iv5cRCFDSob8BPcaWWTI0njJK9aBJ4vX6/A7DAH7Pb5xMO7+/bRzh9AkxJ+YAwy9cgE3SRxKPoOc6s+M6r3jMIr2E9KGEBH74TeKF214ILtGhaC5iqQ==; s=purelymail2; d=purelymail.com; v=1; bh=U7X/b1Kbs5OCvRU0GBpntLuEMIQcaq4SlMHIgv5+ST4=; h=Feedback-ID:Received:Date:Subject:From:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-mediatek@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1123033842;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Tue, 30 Sep 2025 13:25:17 +0000 (UTC)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Sep 2025 15:25:15 +0200
Message-Id: <DD662SOW0PU8.39URFW81IWSLU@mentallysanemainliners.org>
Subject: Re: [PATCH v5 0/8] Add support MT6316/6363/MT6373 PMICs regulators
 and MFD
From: "Igor Belwon" <igor.belwon@mentallysanemainliners.org>
To: "AngeloGioacchino Del Regno" <angelogioacchino.delregno@collabora.com>,
 "Igor Belwon" <igor.belwon@mentallysanemainliners.org>,
 <linux-mediatek@lists.infradead.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20250715140224.206329-1-angelogioacchino.delregno@collabora.com> <DD5B2MK444DP.BA3ZBBY5Z6HZ@mentallysanemainliners.org> <b69b2bf8-2226-4dd4-97b7-a6bf17cc4f94@collabora.com>
In-Reply-To: <b69b2bf8-2226-4dd4-97b7-a6bf17cc4f94@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250930_062521_694871_68DD16CC 
X-CRM114-Status: GOOD (  27.22  )
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

On Tue Sep 30, 2025 at 11:30 AM CEST, AngeloGioacchino Del Regno wrote:
> Il 29/09/25 15:07, Igor Belwon ha scritto:
>> On Tue Jul 15, 2025 at 4:02 PM CEST, AngeloGioacchino Del Regno wrote:
>>> This series adds support for three new MediaTek PMICs: MT6316, MT6363
>>> and MT6373 and their variants - used in board designs featuring the
>>> MediaTek MT8196 Chromebook SoC, or the MT6991 Dimensity 9400 Smartphone
>>> SoC.
>>>
>>=20
>> Hi Angelo,
>>=20
>> Apologies for asking, but is there any future for this series? I
>> understand you as a MediaTek maintainer have a lot of work on your head =
-
>> however as part of my MT6878 upstreaming work, getting this series merge=
d
>> would really be beneficial.
>>=20
>> I only have MT6363 (well, also 6685, 6319 and 6369, but expect a
>> seperate patchset for these) on my platform, so I'm unable to pick up
>> the work for other PMICs anyway.
>>=20
>> Thanks and regards,
>> Igor
>
> No worries about asking - that's totally legit!
>
> Happy to see that you're going serious with the upstreaming of the Dimens=
ity 7300!
> I admit I'd be proud to finally see some modern MediaTek smartphone upstr=
eam, as
> there is practically none (well, apart from some old-old-old stuff that I=
 added
> and - ugh - only partially) and I don't think that those deserve to becom=
e e-waste
> "just like that".
>

Thanks for responding.
My upstreaming work is fortunately for a much modern device - the 2024
CMF Phone 1.=20

> Those regulators are required for the MediaTek Kompanio Ultra (MT8196) So=
C, and yes
> I plan to respin this series as soon as possible.
>
> I should also be trying to upstream the MT6685 RTC in the future (not clk=
buf, most
> probably, as that doesn't seem to be actually needed for anything meaning=
ful).>

Thanks!

> As for MT6319 and MT6369, I currently have no plans for upstreaming those=
, at least
> for now.
>

No worries at all - leave some for me! :)

> Besides, does the Dimensity 7300 also use SPMI 2.0?
> In case you missed it:=20
> https://lore.kernel.org/all/c31bc281-94d5-40b6-a9bd-76b41769f6e5@collabor=
a.com
>

Yep, it's SPMI2 from what I remember.
Thanks, I'll try to bring up the PMICs soon using these patches.

> Also - if this can help you in any way, we (as Collabora) are performing =
all of the
> upstreaming work publicly: the commits that aren't "exactly ready yet" (b=
ut working
> anyway) are of course available to everyone... and also some WIP things.
>
> This includes, for example, the SCMI TinySYS Protocol (which probably D73=
00 also
> uses) and DVFSRC v4 code, other than devicetrees that are close to upstre=
am for the
> MT8196 platform - of which, some new style nodes should apply to your SoC=
 (not in
> a 1:1 copy-paste fashion, but you get the point, I guess).
>
> Check it out:
> https://gitlab.collabora.com/mediatek/aiot/linux/-/commits/mediatek-dev
>
> Beware that we have multiple branches, and some may be more updated than =
others.
>
> ...and we also have some documentation that could help:
> https://gitlab.collabora.com/mediatek/aiot/wiki/-/blob/main/README.md
>

Thanks a ton, I'll definitely be taking a look.

>
> Cheers,
> Angelo

Regards,
Igor


