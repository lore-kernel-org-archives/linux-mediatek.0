Return-Path: <SRS0=heX2=CN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38538C43461
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 07:59:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB8E8206B8
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Sep 2020 07:59:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vUR72eLw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB8E8206B8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RxCK3IEtrdy3JFmiC1SnnWmiSAiy3TKl+x24UnqQ3x0=; b=vUR72eLwD2tNPETji5SAPP7G8
	rZmHBPwCrHp55Po/vY2zb8rBwhAZLdnba38i6qAbQjoV1QierBfh7E4/BGDQUF9Bt8iK2Ap0gF77Y
	WlMRVdztGDy5hexlPy4yFiEAfL8OlPX5oEUZmeoKZ/kdf1xPC5uFkK7yHogzWCwwe+tCL7o5kGl/G
	KATTQ/xh2mqTyMO8mgMVgSrYg1fBPX6WHauEI4Fa1eM4f2Z6bOFawus5vf7GfkAb3N8H/kdsmQwCy
	jbThyopT1BQRRaOI0JG+Ex1pK+/cl3g7DUQQIWuI+Jw21R2KjqBQlE8c7EwVQmi97vAiQp/cMTG++
	Nq/kNtiNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kE6dR-0004er-PY; Fri, 04 Sep 2020 07:59:49 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kE6dP-0004cz-4V
 for linux-mediatek@lists.infradead.org; Fri, 04 Sep 2020 07:59:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: eballetbo) with ESMTPSA id 2D56729AFE0
Subject: Re: [PATCH] media: mtk-mdp: Fix Null pointer dereference when calling
 list_add
To: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-media@vger.kernel.org
References: <20200828135541.8282-1-dafna.hirschfeld@collabora.com>
From: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Message-ID: <d61eb22b-f3b7-50bb-f44f-629928d5e8c8@collabora.com>
Date: Fri, 4 Sep 2020 09:59:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200828135541.8282-1-dafna.hirschfeld@collabora.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_035947_436635_E93AB803 
X-CRM114-Status: GOOD (  20.76  )
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
Cc: matthias.bgg@gmail.com, hverkuil@xs4all.nl, dafna3@gmail.com,
 mchehab@kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Dafna,

Thank you to work on this fix.

On 28/8/20 15:55, Dafna Hirschfeld wrote:
> In list_add, the first variable is the new node and the second
> is the list head. The function is called with a wrong order causing
> NULL dereference:
> 
> [   15.527030] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000008
> [   15.542317] Mem abort info:
> [   15.545152]   ESR = 0x96000044
> [   15.548248]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   15.553624]   SET = 0, FnV = 0
> [   15.556715]   EA = 0, S1PTW = 0
> [   15.559892] Data abort info:
> [   15.562799]   ISV = 0, ISS = 0x00000044
> [   15.566678]   CM = 0, WnR = 1
> [   15.569683] user pgtable: 4k pages, 48-bit VAs, pgdp=00000001373f0000
> [   15.576196] [0000000000000008] pgd=0000000000000000, p4d=0000000000000000
> [   15.583101] Internal error: Oops: 96000044 [#1] PREEMPT SMP
> [   15.588747] Modules linked in: mtk_mdp(+) cfg80211 v4l2_mem2mem videobuf2_vmalloc videobuf2_dma_contig videobuf2_memops videobuf2_v4l2 videobuf2_common vide
> odev mt8173_rt5650 smsc95xx usbnet ecdh_generic ecc snd_soc_rt5645 mc mt8173_afe_pcm rfkill cros_ec_sensors snd_soc_mtk_common elan_i2c crct10dif_ce cros_ec_se
> nsors_core snd_soc_rl6231 elants_i2c industrialio_triggered_buffer kfifo_buf mtk_vpu cros_ec_chardev cros_usbpd_charger cros_usbpd_logger sbs_battery display_c
> onnector pwm_bl ip_tables x_tables ipv6
> [   15.634295] CPU: 0 PID: 188 Comm: systemd-udevd Not tainted 5.9.0-rc2+ #69
> [   15.641242] Hardware name: Google Elm (DT)
> [   15.645381] pstate: 20000005 (nzCv daif -PAN -UAO BTYPE=--)
> [   15.651022] pc : mtk_mdp_probe+0x134/0x3a8 [mtk_mdp]
> [   15.656041] lr : mtk_mdp_probe+0x128/0x3a8 [mtk_mdp]
> [   15.661055] sp : ffff80001255b910
> [   15.669548] x29: ffff80001255b910 x28: 0000000000000000
> [   15.679973] x27: ffff800009089bf8 x26: ffff0000fafde800
> [   15.690347] x25: ffff0000ff7d2768 x24: ffff800009089010
> [   15.700670] x23: ffff0000f01a7cd8 x22: ffff0000fafde810
> [   15.710940] x21: ffff0000f01a7c80 x20: ffff0000f0c3c180
> [   15.721148] x19: ffff0000ff7f1618 x18: 0000000000000010
> [   15.731289] x17: 0000000000000000 x16: 0000000000000000
> [   15.741375] x15: 0000000000aaaaaa x14: 0000000000000020
> [   15.751399] x13: 00000000ffffffff x12: 0000000000000020
> [   15.761363] x11: 0000000000000028 x10: 0101010101010101
> [   15.771279] x9 : 0000000000000004 x8 : 7f7f7f7f7f7f7f7f
> [   15.781148] x7 : 646bff6171606b2b x6 : 0000000000806d65
> [   15.790981] x5 : ffff0000ff7f8360 x4 : 0000000000000000
> [   15.800767] x3 : 0000000000000004 x2 : 0000000000000001
> [   15.810501] x1 : 0000000000000005 x0 : 0000000000000000
> [   15.820171] Call trace:
> [   15.826944]  mtk_mdp_probe+0x134/0x3a8 [mtk_mdp]
> [   15.835908]  platform_drv_probe+0x54/0xa8
> [   15.844247]  really_probe+0xe4/0x3b0
> [   15.852104]  driver_probe_device+0x58/0xb8
> [   15.860457]  device_driver_attach+0x74/0x80
> [   15.868854]  __driver_attach+0x58/0xe0
> [   15.876770]  bus_for_each_dev+0x70/0xc0
> [   15.884726]  driver_attach+0x24/0x30
> [   15.892374]  bus_add_driver+0x14c/0x1f0
> [   15.900295]  driver_register+0x64/0x120
> [   15.908168]  __platform_driver_register+0x48/0x58
> [   15.916864]  mtk_mdp_driver_init+0x20/0x1000 [mtk_mdp]
> [   15.925943]  do_one_initcall+0x54/0x1b4
> [   15.933662]  do_init_module+0x54/0x200
> [   15.941246]  load_module+0x1cf8/0x22d0
> [   15.948798]  __do_sys_finit_module+0xd8/0xf0
> [   15.956829]  __arm64_sys_finit_module+0x20/0x30
> [   15.965082]  el0_svc_common.constprop.0+0x6c/0x168
> [   15.973527]  do_el0_svc+0x24/0x90
> [   15.980403]  el0_sync_handler+0x90/0x198
> [   15.987867]  el0_sync+0x158/0x180
> [   15.994653] Code: 9400014b 2a0003fc 35000920 f9400280 (f9000417)
> [   16.004299] ---[ end trace 76fee0203f9898e5 ]---
> 
> Fixes: 86698b9505bbc ("media: mtk-mdp: convert mtk_mdp_dev.comp array to list")
> Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
> ---
>  drivers/media/platform/mtk-mdp/mtk_mdp_core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> index f96c8b3bf861..976aa1f4829b 100644
> --- a/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> +++ b/drivers/media/platform/mtk-mdp/mtk_mdp_core.c
> @@ -94,7 +94,7 @@ static void mtk_mdp_reset_handler(void *priv)
>  void mtk_mdp_register_component(struct mtk_mdp_dev *mdp,
>  				struct mtk_mdp_comp *comp)
>  {
> -	list_add(&mdp->comp_list, &comp->node);
> +	list_add(&comp->node, &mdp->comp_list);
>  }
>  
>  void mtk_mdp_unregister_component(struct mtk_mdp_dev *mdp,
> 

FWIW this also fixes my problems with suspend/resume on my Acer Chromebook R13, so:

Tested-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>





_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
