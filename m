From: Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v6 2/8] drm/panel: support for BOE tv101wum-nl6 wuxga dsi
 video mode panel
Date: Wed, 18 Sep 2019 11:35:15 -0400
Message-ID: <20190918153515.GS218215@art_vandelay>
References: <20190918122422.17339-1-jitao.shi@mediatek.com>
 <20190918122422.17339-3-jitao.shi@mediatek.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190918122422.17339-3-jitao.shi@mediatek.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Jitao Shi <jitao.shi@mediatek.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, srv_heupstream@mediatek.com, stonea168@163.com, cawa.cheng@mediatek.com, linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com, eddie.huang@mediatek.com
List-Id: linux-mediatek@lists.infradead.org

On Wed, Sep 18, 2019 at 08:24:16PM +0800, Jitao Shi wrote:
> Add driver for BOE tv101wum-nl6 panel is a 10.1" 1200x1920 panel.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/panel/Kconfig                 |   9 +
>  drivers/gpu/drm/panel/Makefile                |   1 +
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 709 ++++++++++++++++++
>  3 files changed, 719 insertions(+)
>  create mode 100644 drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> 
/snip

> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> new file mode 100644
> index 000000000000..e27529b80d78
> --- /dev/null
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c

/snip

> +static int boe_panel_init(struct boe_panel *boe)
> +{
> +	struct mipi_dsi_device *dsi = boe->dsi;
> +	struct drm_panel *panel = &boe->base;
> +	int err, i;
> +
> +	if (boe->desc->init_cmds) {
> +		const struct panel_init_cmd *init_cmds = boe->desc->init_cmds;
> +
> +		for (i = 0; init_cmds[i].len != 0; i++) {
> +			const struct panel_init_cmd *cmd = &init_cmds[i];
> +
> +			switch (cmd->type) {
> +			case DELAY_CMD:
> +				msleep(cmd->data[0]);
> +				err = 0;
> +				break;
> +
> +			case INIT_DCS_CMD:
> +				err = mipi_dsi_dcs_write(dsi, cmd->data[0],
> +							 cmd->len <= 1 ? NULL :
> +							 &cmd->data[1],
> +							 cmd->len - 1);
> +				break;
> +			}
> +
> +			if (err < 0) {

err possibly used uninitialized here.

> +				dev_err(panel->dev,
> +					"failed to write command %u\n", i);
> +				return err;
> +			}
> +		}
> +	}
> +	return 0;
> +}
/snip

> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Sean Paul, Software Engineer, Google / Chromium OS
