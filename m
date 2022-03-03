Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2EE5C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Mar 2022 09:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zjZeMoj6q0BaxxySDQnmWxtXjGprOTEnFg9bAnXH/y4=; b=S6PYrhdInDPjauKUA/Q7p+0EfX
	tYvcHH/Um+v2I5a2Kcw30/h41RwxQIOaHCpgYRQt82xNIb8ab+N0VtnPIzMWZ0fs2xb82IK/im1tY
	I1z/kbIRXp0EW3jY83ml2o5U8BG681EU6PNrmlaueKQYgvEuQ9UoesMXxCDBAF2mmNEmzwA4MU7qu
	brmbSXIrirGktbv+bJVevqsILe3+SKmZm3xpcXHhvP7UotVsApePFDD8mxPwjqk39AG/WFiK2+nCT
	DlnQcT9R0IlE4KbwR5t8LDMw1QaIwJph9XwMM9G5NHleEN6P4/rjEVcQN4L1LT29vmeTsqsSxVXLG
	a4uxMapw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nPhoT-005uBx-CE; Thu, 03 Mar 2022 09:31:57 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nPhoG-005u9b-Sm; Thu, 03 Mar 2022 09:31:46 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 94AC71F45394
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646299903;
 bh=7BamnJwMgtqrT3JoQ68Ebed6Mw0Z4qhgq17wKkO7uZQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DsKwhWmYCfBFjIrDoWzkxPNJKmtBbRcsgc1JMZx9lfNHbf04n0AFN6jYOU5/79Sgw
 nyvDJ6M5EkqPGymiwkWb9kne6FdPEpfJ7vttPbObbeF56henBC6oGc/RTdSSjfFW6+
 VC8zJrNU1oQ4UK0ECsXCpbxrdqn7cMaBEEa6/oHh5jqH6bCErPARX3ha6Zno76b3E+
 mVHxV/HiSCkOtzQ38z1XM+GaVwYW7hIpmZE01VSoCluMtv/2M2vCwEAIzg0+8JiSmH
 crxIXXQ4Kl6XsDKLzr6kxkK6ds2BQl0YGHLhGRoZPLryIOwv7sDw2menm+j746SUHW
 LfIys7ju/p13w==
Message-ID: <28098efc-1de1-b540-b1a3-bf7a92af9511@collabora.com>
Date: Thu, 3 Mar 2022 10:31:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v15 00/12] Add Mediatek Soc DRM (vdosys0) support for
 mt8195
Content-Language: en-US
To: Jason-JH Lin <jason-jh.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>
References: <20220126071932.32615-1-jason-jh.lin@mediatek.com>
 <CAL_Jsq+6k5EqouAO2Xm=GpBz3Pi-wfB-ixGwfyC+Y+qOrjUFTg@mail.gmail.com>
 <c103927d7dbc3217431c83dc22a44c656c561228.camel@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <c103927d7dbc3217431c83dc22a44c656c561228.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220303_013145_090663_FEF91E61 
X-CRM114-Status: GOOD (  13.32  )
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao shi <jitao.shi@mediatek.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 singo.chang@mediatek.com, Fabien Parent <fparent@baylibre.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 "roy-cw.yeh" <roy-cw.yeh@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 devicetree@vger.kernel.org, Moudy Ho <moudy.ho@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Daniel Vetter <daniel@ffwll.ch>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, nancy.lin@mediatek.com,
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 03/03/22 05:25, Jason-JH Lin ha scritto:
> Hi Rob,
> 
> Thanks for the reviews.
> 
> On Wed, 2022-03-02 at 17:50 -0600, Rob Herring wrote:
>> On Wed, Jan 26, 2022 at 1:19 AM jason-jh.lin <
>> jason-jh.lin@mediatek.com> wrote:
>>>
> 
> [snip]
> 

Hello Rob, Jason-JH,

I have just crafted a patch that fixes everything mentioned here,
if it's easier like this, I can either send it for the maintainer(s)
to apply on top, or squash in Jason-JH's original patch.

If you'd like to get my patch, though, I have one question:
this is touching literally all of the YAML files that Jason-JH is
introducing, so, should I send this as one patch per file (which would be
something around 16 patches) or is just one fixing them all fine?

Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
