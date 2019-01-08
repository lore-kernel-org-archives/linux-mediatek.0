From: Mars Cheng <mars.cheng@mediatek.com>
Subject: Re: [PATCH v2 0/3] Mark clocks as critical for MT6797
Date: Tue, 8 Jan 2019 11:05:04 +0800
Message-ID: <1546916704.4994.3.camel@mtkswgap22>
References: <20181116180901.17737-1-matthias.bgg@kernel.org>
         <154356044342.88331.13729809794593193239@swboyd.mtv.corp.google.com>
         <8e8b9c0f-7647-daa4-504b-7b86bcd45a04@gmail.com>
         <154689458947.15366.14390825810412394676@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154689458947.15366.14390825810412394676@swboyd.mtv.corp.google.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin-CW Chen <kevin-cw.chen@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, matthias.bgg@kernel.org, mturquette@baylibre.com, Matthias Brugger <mbrugger@suse.com>, sean.wang@kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, jasu@njomotys.info, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-mediatek@lists.infradead.org

Hi Stephen/Matthias

On Mon, 2019-01-07 at 12:56 -0800, Stephen Boyd wrote:
> Quoting Matthias Brugger (2018-11-30 01:04:02)
> > 
> > 
> > On 30/11/2018 07:47, Stephen Boyd wrote:
> > > Quoting matthias.bgg@kernel.org (2018-11-16 10:08:58)
> > >> From: Matthias Brugger <mbrugger@suse.com>
> > >>
> > >> Jasper send this series some month ago. As there was no reaction from
> > >> his side, I'll do a friendly take-over.
> > >> I tested the patches on my Helios X20 boards and they fix the issue.
> > >> I didn't add a Tested-by tag as I added my Signed-off-by.
> > >>
> > >> Changes since v1:
> > >> - add a fixes tag.
> > >>
> > >> ---
> > >>
> > >> Currently, DRAM-related clocks and the axi_sel MUX are not marked with
> > >> CLK_IS_CRITICAL for MT6797. This causes memory corruption when the
> > >> system is booted without clk_ignore_unused.
> > >>
> > >> This patchset
> > >>
> > >> 1. Makes it possible to mark outputs of MUXes as critical by introducing
> > >>    a new macro, MUX_FLAGS,
> > >> 2. Makes it possible to mark gates as critical by adding flags to
> > >>    mtk_gate, and
> > >> 3. Marks axi_sel, ddrphycfg_sel, infra_dramc_f26m and infra_dramc_b_f26m
> > >>    as critical.
> > >>
> > >> The addition of flags to mtk_gate also exists in the patch series "Add
> > >> basic and clock support for Mediatek MT8183 SoC" [1].  The type of
> > >> flags is unsigned int in that series, but the real type is unsigned
> > >> long, so my patch differs from that patch.
> > > 
> > > Will anyone from Mediatek review this? Why aren't the people who signed
> > > off on drivers/clk/mediatek/clk-mt6797.c included on this patch series?
> > > They no longer work there?
> > > 
> > 
> > My fault, I'll resend 3/3 with the comments you made. Added Kevin-CW now...
> 
> I never saw anything on the list. Did I miss anything? I have the first
> two patches in my local queue still but I never merged it to clk-next
> because nobody replied or resent anything. Please resend the whole
> series because I've lost track of what's going on now. Sorry.
> 
> 

sorry for late response. Kelvin-CW and I are responsible for 6797
clk.You have my Ack:
Acked-by: Mars Cheng <mars.cheng@mediatek.com>

Thanks.
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
